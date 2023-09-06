import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/block_state.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_viewmodel.g.dart';

/// Block logic.
///
/// ViewModel for [BlockWidget].
@riverpod
class BlockViewModel extends _$BlockViewModel {
  /// Get props and initialize the Block.
  @override
  BlockState build({
    required final DatabaseProps databaseProps,
    required final BlockTextEditingController blockTextEditingController,
    required final BuildContext context,
    required final ValueChanged<TextSelection> onExtentOffsetChanged,
    required final TextSelection cursorExtentOffset,
  }) {
    final blockCollection =
        databaseProps.databaseManager.getBlockCollectionById(databaseProps.id);

    if (blockCollection == null) {
      throw FileSystemException(
          'Failed to get Block of ID ${databaseProps.id}');
    }

    blockTextEditingController.blockCollection = blockCollection;
    blockTextEditingController.text = blockCollection.text;

    blockTextEditingController.addListener(handleInput);

    return BlockState(
      blockCollection: blockCollection,
    );
  }

  void onFocusChanged(bool gainsFocus) {
    if (gainsFocus) {
      blockTextEditingController.selection = cursorExtentOffset;
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
        state.blockCollection.copyWith(text: blockTextEditingController.text);

    blockTextEditingController.blockCollection = newBlockCollection;

    onExtentOffsetChanged(TextSelection.collapsed(
        offset: blockTextEditingController.selection.extentOffset));

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

      onExtentOffsetChanged(const TextSelection.collapsed(offset: 0));

      FocusScope.of(context).nextFocus();
      FocusScope.of(context).nextFocus();
    }

    // Write into database.
    databaseProps.databaseManager.putBlockCollection(newBlockCollection);

    state = state.copyWith(blockCollection: newBlockCollection);
  }

  KeyEventResult handleEditorTraversal(FocusNode focusNode, KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          focusNode.nextFocus();
          focusNode.nextFocus();
        case LogicalKeyboardKey.arrowUp:
          focusNode.previousFocus();
          focusNode.previousFocus();
        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
