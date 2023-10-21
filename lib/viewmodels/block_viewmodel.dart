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
@riverpod
class BlockViewModel extends _$BlockViewModel {
  RenderEditable? _blockRenderEditableCache;

  RenderEditable get _blockRenderEditable {
    _findRenderEditable();

    if (_blockRenderEditableCache == null) {
      throw FormatException(
          'ERROR: Unable to find Block ${databaseProps.id} RenderEditable.');
    }
    return _blockRenderEditableCache!;
  }

  /// Get props and initialize the Block.
  @override
  BlockCollection build({
    required final DatabaseProps databaseProps,
    required final GlobalKey blockKey,
    required final BlockTextEditingController blockTextEditingController,
  }) {
    final blockCollection =
        databaseProps.databaseManager.getBlockCollectionById(databaseProps.id);

    // Set initial block values
    blockTextEditingController.blockCollection = blockCollection;
    blockTextEditingController.text = blockCollection.text;

    // Listen for changes
    blockTextEditingController.addListener(handleInput);

    // Subscribe to changes and update state
    databaseProps.databaseManager.onBlockChanged(databaseProps.id).listen(
      (blockCollection) {
        if (blockCollection == null) return;

        // Handle text updates not originating from TextEditingController.
        if (blockTextEditingController.text != blockCollection.text) {
          blockTextEditingController.text = blockCollection.text;
        }
      },
    );

    return blockCollection;
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

    // Record new caret position if current block is in focus and if there was a change.
    if (ref.read(idOfBlockInFocusProvider).blockId == databaseProps.id &&
        ref.read(caretViewModelProvider).caretPosition !=
            blockTextEditingController.selection.extentOffset) {
      ref.read(caretViewModelProvider.notifier).update(
            caretPosition: blockTextEditingController.selection.extentOffset,
          );
    }

    // Shortcut exit if no change to text.
    if (blockTextEditingController.text == state.text) return;

    // Create updated Block.
    final newBlockCollection =
        state.copyWith(text: blockTextEditingController.text);

    blockTextEditingController.blockCollection = newBlockCollection;

    // Write into database.
    databaseProps.databaseManager.putBlockCollection(newBlockCollection);

    state = newBlockCollection;
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
                blockId: databaseProps.databaseManager.getIdOfBlockAfter(state),
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
                blockId:
                    databaseProps.databaseManager.getIdOfBlockBefore(state),
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.arrowLeft:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }
          final idOfBlockBefore =
              databaseProps.databaseManager.getIdOfBlockBefore(state);
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
                blockId: databaseProps.databaseManager.getIdOfBlockAfter(state),
                setFromTraversal: true,
              );
        case LogicalKeyboardKey.enter || LogicalKeyboardKey.numpadEnter:
        // Split text between current and next Block.
          final nextBlockCollection = BlockCollection(
            parent: state.parent,
            text: blockTextEditingController.selection
                .textAfter(blockTextEditingController.text),
          );
          blockTextEditingController.text = blockTextEditingController.selection
              .textBefore(blockTextEditingController.text);

          // Insert new Block into parent.
          databaseProps.databaseManager.insertBlockAfter(
            sourceBlockCollection: state,
            newBlockCollection: nextBlockCollection,
          );

          // Set cursor to be at the start of the new Block.
          final nextBlockId =
              databaseProps.databaseManager.getIdOfBlockAfter(state);
          ref.read(caretViewModelProvider.notifier).update(
                caretPosition: 0,
              );
          ref.read(idOfBlockInFocusProvider.notifier).update(
                blockId: nextBlockId,
                setFromTraversal: true,
              );

          // Record the new text into the Block.
          state = state.copyWith(text: blockTextEditingController.text);
        case LogicalKeyboardKey.backspace:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }

          // Get Block before.
          final idOfBlockBefore =
              databaseProps.databaseManager.getIdOfBlockBefore(state);
          if (idOfBlockBefore == null) {
            return KeyEventResult.ignored;
          }
          final blockBefore = databaseProps.databaseManager
              .getBlockCollectionById(idOfBlockBefore);

          final updatedBlockBefore = blockBefore.copyWith(
            childIds: blockBefore.childIds.toList()..addAll(state.childIds),
            text: blockBefore.text + state.text,
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
          databaseProps.databaseManager.deleteBlockCollection(state);
        case LogicalKeyboardKey.delete:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }

          // Get Block after.
          final idOfBlockAfter =
              databaseProps.databaseManager.getIdOfBlockAfter(state);
          if (idOfBlockAfter == null) {
            return KeyEventResult.ignored;
          }
          final blockAfter = databaseProps.databaseManager
              .getBlockCollectionById(idOfBlockAfter);

          blockTextEditingController.value =
              blockTextEditingController.value.copyWith(
            text: state.text + blockAfter.text,
            selection: blockTextEditingController.selection,
          );

          final updatedBlock = state.copyWith(
            childIds: state.childIds.toList()..addAll(blockAfter.childIds),
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
