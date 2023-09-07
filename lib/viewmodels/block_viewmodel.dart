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
    required final BuildContext context,
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

    // Handle new-lines
    final index = blockTextEditingController.text.indexOf('\n');
    if (index > -1) {
      final nextBlockCollection = BlockCollection(
        text: blockTextEditingController.text
            .substring(blockTextEditingController.selection.extentOffset),
      );
      blockTextEditingController.text =
          blockTextEditingController.text.substring(
        0,
        max(blockTextEditingController.selection.baseOffset - 1, 0),
      );
      databaseProps.databaseManager.insertBlockAfter(
        blockId: databaseProps.id,
        blockCollection: nextBlockCollection,
      );

      // Setup caret for next focus
      ref.read(caretViewModelProvider.notifier).updateCaret(
            caretPosition: 0,
            setFromFocusChange: true,
          );

      FocusScope.of(context).nextFocus();
      FocusScope.of(context).nextFocus();
    }

    // Write into database.
    databaseProps.databaseManager.putBlockCollection(newBlockCollection);

    state = newBlockCollection;
  }

  KeyEventResult handleEditorTraversal(FocusNode focusNode, KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition:
                    blockTextEditingController.selection.extentOffset,
                setFromFocusChange: true,
              );
          focusNode.nextFocus();
          focusNode.nextFocus();
        case LogicalKeyboardKey.arrowUp:
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition:
                    blockTextEditingController.selection.extentOffset,
                setFromFocusChange: true,
              );
          focusNode.previousFocus();
          focusNode.previousFocus();
        case LogicalKeyboardKey.arrowLeft:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: -1,
                setFromFocusChange: true,
              );
          focusNode.previousFocus();
          focusNode.previousFocus();
        case LogicalKeyboardKey.arrowRight:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: 0,
                setFromFocusChange: true,
              );
          focusNode.nextFocus();
          focusNode.nextFocus();
        case LogicalKeyboardKey.backspace:
          if (blockTextEditingController.selection.extentOffset != 0) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: -1,
                setFromFocusChange: true,
              );
          focusNode.previousFocus();
          focusNode.previousFocus();
        case LogicalKeyboardKey.delete:
          if (blockTextEditingController.selection.extentOffset !=
              blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }
          ref.read(caretViewModelProvider.notifier).updateCaret(
                caretPosition: 0,
                setFromFocusChange: true,
              );
          focusNode.nextFocus();
          focusNode.nextFocus();
        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
