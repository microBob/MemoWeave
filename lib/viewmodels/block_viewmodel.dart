import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/utils/id_of_block_in_focus.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/caret_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_viewmodel.g.dart';

/// Block logic.
///
/// ViewModel for [BlockWidget].
/// TextField hold it's own state, so this VM is for syncing
/// the text field's state with the database.
@riverpod
class BlockViewModel extends _$BlockViewModel {
  // Local cached copies of components.
  RenderEditable? _blockRenderEditableCache;
  BlockCollection? _blockCollectionCache;

  /// Cache loader for [RenderEditable].
  RenderEditable get _blockRenderEditable {
    _findRenderEditable();

    if (_blockRenderEditableCache == null) {
      throw FormatException(
          'ERROR: Unable to find Block ${databaseProps.id} RenderEditable.');
    }
    return _blockRenderEditableCache!;
  }

  /// Cache loader for [BlockCollection].
  BlockCollection get _blockCollection {
    // Load from database if needed.
    _blockCollectionCache ??=
        databaseProps.databaseManager.getBlockCollectionById(databaseProps.id);

    // Return cached copy.
    return _blockCollectionCache!;
  }

  /// Get props and initialize the Block.
  @override
  void build({
    required final DatabaseProps databaseProps,
    required final BlockTextEditingController blockTextEditingController,
    required final GlobalKey blockKey,
    required final FocusNode blockFocusNode,
  }) {
    // Set initial block values.
    blockTextEditingController.blockCollection = _blockCollection;
    blockTextEditingController.text = _blockCollection.text;

    // Give this block focus if requested
    ref.read(idOfBlockInFocusProvider).blockId == databaseProps.id
        ? blockFocusNode.requestFocus()
        : blockFocusNode.unfocus();

    // Listen and set focus for this block.
    ref.listen(idOfBlockInFocusProvider, (previous, next) {
      // Only request focus if the focus was changed.
      if (previous?.blockId != next.blockId &&
          next.blockId == databaseProps.id) {
        blockFocusNode.requestFocus();
      }
    });

    // Listen for text changes.
    blockTextEditingController.addListener(handleInput);

    // Subscribe to changes with the database.
    databaseProps.databaseManager.onBlockChanged(databaseProps.id).listen(
      (blockCollection) {
        if (blockCollection == null) return;

        // Update local cache.
        _blockCollectionCache = blockCollection;

        // Handle text updates not originating from TextEditingController.
        if (blockTextEditingController.text != blockCollection.text) {
          blockTextEditingController.text = blockCollection.text;
        }
      },
    );
  }

  /// Handle when this block's main TextField gains or loses focus.
  ///
  /// Updates focus providers and apply selection requests.
  void onFocusChanged(bool gainsFocus) {
    if (gainsFocus) {
      final idOfBlockInFocusState = ref.read(idOfBlockInFocusProvider);
      if (idOfBlockInFocusState.setFromTraversal) {
        // Set caret position as instructed from origin.
        blockTextEditingController.selection = TextSelection.collapsed(
          offset: min(
            ref.read(caretViewModelProvider).caretPosition,
            blockTextEditingController.text.length,
          ),
        );

        // Acknowledged caret position is set.
        ref
            .read(idOfBlockInFocusProvider.notifier)
            .update(setFromTraversal: false);
      } else {
        // Acknowledge this block is in focus.
        ref
            .read(idOfBlockInFocusProvider.notifier)
            .update(blockId: databaseProps.id);
      }
    }
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() {
    // Shortcut exit if the selection is invalid.
    if (!blockTextEditingController.selection.isValid) return;

    // Record new caret position if current block is in focus
    // and if there was a change.
    if (ref.read(idOfBlockInFocusProvider).blockId == databaseProps.id &&
        ref.read(caretViewModelProvider).caretPosition !=
            blockTextEditingController.selection.extentOffset) {
      ref.read(caretViewModelProvider.notifier).update(
            caretPosition: blockTextEditingController.selection.extentOffset,
          );
    }

    // Shortcut exit if no change to text.
    if (blockTextEditingController.text == _blockCollection.text) return;

    // Create updated Block.
    final newBlockCollection =
        _blockCollection.copyWith(text: blockTextEditingController.text);

    // Update text controller with new block collection.
    blockTextEditingController.blockCollection = newBlockCollection;

    // Write into database.
    databaseProps.databaseManager.putBlockCollection(newBlockCollection);
  }

  KeyEventResult handleEditorTraversal(FocusNode focusNode, KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          // Get current line as a TextSelection.
          final currentLineAsTextSelection =
              _blockRenderEditable.getLineAtOffset(
            TextPosition(
              offset: blockTextEditingController.selection.extentOffset,
            ),
          );

          // Shortcut exit if not on last line.
          if (!blockTextEditingController.text.endsWith(
            blockTextEditingController.text.substring(
              currentLineAsTextSelection.start,
              currentLineAsTextSelection.end,
            ),
          )) {
            return KeyEventResult.ignored;
          }

          // Move line down.
          ref.read(caretViewModelProvider.notifier).update(
                caretPosition:
                    blockTextEditingController.selection.extentOffset,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: databaseProps.databaseManager
                    .getIdOfBlockAfter(_blockCollection),
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.arrowUp:
          // Get current line as a TextSelection.
          final currentLineAsTextSelection =
              _blockRenderEditable.getLineAtOffset(
            TextPosition(
              offset: blockTextEditingController.selection.extentOffset,
            ),
          );

          // Shortcut exit if not on first line.
          if (!blockTextEditingController.text.startsWith(
            blockTextEditingController.text.substring(
              currentLineAsTextSelection.start,
              currentLineAsTextSelection.end,
            ),
          )) {
            return KeyEventResult.ignored;
          }

          // Move line up.
          ref.read(caretViewModelProvider.notifier).update(
                caretPosition:
                    blockTextEditingController.selection.extentOffset,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
            blockId: databaseProps.databaseManager
                    .getIdOfBlockBefore(_blockCollection),
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.arrowLeft:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }
          final idOfBlockBefore = databaseProps.databaseManager
              .getIdOfBlockBefore(_blockCollection);
          if (idOfBlockBefore == null) {
            return KeyEventResult.ignored;
          }
          final blockBefore = databaseProps.databaseManager
              .getBlockCollectionById(idOfBlockBefore);

          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: blockBefore.text.length,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: idOfBlockBefore,
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.arrowRight:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: 0,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
            blockId: databaseProps.databaseManager
                    .getIdOfBlockAfter(_blockCollection),
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.enter || LogicalKeyboardKey.numpadEnter:
        // Split text between current and next Block.
          final nextBlockCollection = BlockCollection(
            parent: _blockCollection.parent,
            text: blockTextEditingController.selection
                .textAfter(blockTextEditingController.text),
          );
          blockTextEditingController.text = blockTextEditingController.selection
              .textBefore(blockTextEditingController.text);

          // Insert new Block into parent.
          databaseProps.databaseManager.insertBlockAfter(
            sourceBlockCollection: _blockCollection,
            newBlockCollection: nextBlockCollection,
          );

          // Set cursor to be at the start of the new Block.
          final nextBlockId =
              databaseProps.databaseManager.getIdOfBlockAfter(_blockCollection);
          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: 0,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: nextBlockId,
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.backspace:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }

          // Get Block before.
          final idOfBlockBefore = databaseProps.databaseManager
              .getIdOfBlockBefore(_blockCollection);
          if (idOfBlockBefore == null) {
            return KeyEventResult.ignored;
          }
          final blockBefore = databaseProps.databaseManager
              .getBlockCollectionById(idOfBlockBefore);

          final updatedBlockBefore = blockBefore.copyWith(
            childIds: blockBefore.childIds.toList()
              ..addAll(_blockCollection.childIds),
            text: blockBefore.text + _blockCollection.text,
          );

          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: blockBefore.text.length,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: idOfBlockBefore,
                setFromTraversal: true,
              );

          // FIXME: consider creating a function that does this in one transaction
          databaseProps.databaseManager.putBlockCollection(updatedBlockBefore);
          databaseProps.databaseManager.deleteBlockCollection(_blockCollection);
        case LogicalKeyboardKey.delete:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }

          // Get Block after.
          final idOfBlockAfter =
              databaseProps.databaseManager.getIdOfBlockAfter(_blockCollection);
          if (idOfBlockAfter == null) {
            return KeyEventResult.ignored;
          }
          final blockAfter = databaseProps.databaseManager
              .getBlockCollectionById(idOfBlockAfter);

          blockTextEditingController.value =
              blockTextEditingController.value.copyWith(
            text: _blockCollection.text + blockAfter.text,
            selection: blockTextEditingController.selection,
          );

          final updatedBlock = _blockCollection.copyWith(
            childIds: _blockCollection.childIds.toList()
              ..addAll(blockAfter.childIds),
            text: blockTextEditingController.text,
          );

          databaseProps.databaseManager.putBlockCollection(updatedBlock);
          databaseProps.databaseManager.deleteBlockCollection(blockAfter);

          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: blockTextEditingController.selection.start,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: databaseProps.id,
                setFromTraversal: true,
              );

        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  /// Public getter to the [BlockCollection] this VM is managing.
  BlockCollection getBlockCollection() {
    return _blockCollection;
  }

  /// Search through widget tree to find [RenderEditable].
  ///
  /// Sets [_renderEditable] to the found [RenderEditable].
  void _findRenderEditable([Element? root]) {
    // Shortcut exit if it has already been found.
    if (_blockRenderEditableCache != null) {
      return;
    }

    // Starter case: No element given,
    // then we start from the TextField's children.
    if (root == null) {
      blockKey.currentContext?.visitChildElements((childElement) {
        _findRenderEditable(childElement);
      });
      return;
    }

    // Regular case: Check the current object, then traverse children.
    var renderObject = root.renderObject;
    if (renderObject is RenderEditable) {
      _blockRenderEditableCache = renderObject;
    } else {
      root.visitChildElements((childElement) {
        _findRenderEditable(childElement);
      });
    }
  }
}
