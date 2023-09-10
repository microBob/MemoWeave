import 'dart:io';
import 'dart:math';

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

    if (blockCollection == null) {
      throw FileSystemException(
          'Failed to get Block of ID ${databaseProps.id}');
    }

    // Set initial block values
    blockTextEditingController.blockCollection = blockCollection;
    blockTextEditingController.text = blockCollection.text;

    // Listen for changes
    blockTextEditingController.addListener(handleInput);

    return blockCollection;
  }

  void onFocusChanged(bool gainsFocus) {
    final caretState = ref.read(caretViewModelProvider);
    if (gainsFocus && caretState.setFromFocusChange) {
      final caretPosition = caretState.caretPosition == -1
          ? blockTextEditingController.text.length
          : min(
              caretState.caretPosition, blockTextEditingController.text.length);
      blockTextEditingController.selection =
          TextSelection.collapsed(offset: caretPosition);

      ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: caretPosition,
            setFromFocusChange: false,
          );
    }
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() {
    if (!blockTextEditingController.selection.isValid) return;

    // Create updated Block.
    final newBlockCollection =
        state.copyWith(text: blockTextEditingController.text);

    blockTextEditingController.blockCollection = newBlockCollection;

    // Record new caret position.
    ref.read(caretViewModelProvider.notifier).updateCaret(
        caretPosition: blockTextEditingController.selection.extentOffset);

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
          ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: -1,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockBefore(state),
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

          // Update the current Block.
          state = state.copyWith(text: blockTextEditingController.text);
        case LogicalKeyboardKey.backspace:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: -1,
                idOfBlockInFocus:
                    databaseProps.databaseManager.getIdOfBlockBefore(state),
                setFromFocusChange: true,
              );
        case LogicalKeyboardKey.delete:
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
        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
