import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/caret_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_viewmodel.g.dart';

/// Block logic.
///
/// ViewModel for [BlockWidget].
@riverpod
class BlockViewModel extends _$BlockViewModel {
  /// Get props and initialize the Block.
  @override
  BlockCollection build({
    required final DatabaseProps databaseProps,
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

  void onFocusChanged(bool gainsFocus) {
    final caretState = ref.read(caretViewModelProvider);
    if (gainsFocus && caretState.setFromFocusChange) {
      // Set caret position as instructed from origin.
      blockTextEditingController.selection =
          TextSelection.collapsed(offset: caretState.caretPosition);

      // Acknowledged caret position is set.
      ref.read(caretViewModelProvider.notifier).updateCaret(
            setFromFocusChange: false,
          );
    } else if (gainsFocus) {
      // Acknowledge this block is in focus.
      ref.read(caretViewModelProvider.notifier).updateCaret(
            idOfBlockInFocus: state.id,
          );
    }
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() {
    if (!blockTextEditingController.selection.isValid) return;

    // Record new caret position.
    ref.read(caretViewModelProvider.notifier).updateCaret(
        caretPosition: blockTextEditingController.selection.extentOffset);

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
        // TODO: Check if on last line
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition:
                    blockTextEditingController.selection.extentOffset,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockAfter(state),
                setFromFocusChange: true,
              );
        case LogicalKeyboardKey.arrowUp:
        // TODO: Check if on first line
          ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition:
                    blockTextEditingController.selection.extentOffset,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockBefore(state),
                setFromFocusChange: true,
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

          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: blockBefore.text.length,
                idOfBlockInFocus: idOfBlockBefore,
                setFromFocusChange: true,
              );
        case LogicalKeyboardKey.arrowRight:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: 0,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockAfter(state),
                setFromFocusChange: true,
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
          ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: 0,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockAfter(state),
                setFromFocusChange: true,
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

          // FIXME: consider creating a function that does this in one transaction
          databaseProps.databaseManager.putBlockCollection(updatedBlockBefore);
          databaseProps.databaseManager.deleteBlockCollection(state);

          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: blockBefore.text.length,
                idOfBlockInFocus: idOfBlockBefore,
                setFromFocusChange: true,
              );
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

          ref.read(caretViewModelProvider.notifier).updateCaret(
              caretPosition: blockTextEditingController.selection.start,
              idOfBlockInFocus: state.id,
              setFromFocusChange: true);

        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
