import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoweave/models/block_state.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/database.dart';
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
    required final TextEditingController blockTextEditingController,
  }) {
    print('Building block VC ${databaseProps.id}');
    final blockCollection =
        databaseProps.databaseManager.getBlockCollectionById(databaseProps.id);

    if (blockCollection == null) {
      throw FileSystemException(
          'Failed to get Block of ID ${databaseProps.id}');
    }

    // blockTextEditingController.rootBlock = blockCollection;
    blockTextEditingController.text = blockCollection.text;

    blockTextEditingController.addListener(handleInput);

    return BlockState(
      blockCollection: blockCollection,
    );
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() {
    print(
        'Handling input on Block ${state.blockCollection.id}; text: ${blockTextEditingController.text}, selection: ${blockTextEditingController.selection}');
    if (!blockTextEditingController.selection.isValid) return;
    // Create updated rootBlock.
    final newBlockCollection =
        state.blockCollection.copyWith(text: blockTextEditingController.text);

    // blockTextEditingController.rootBlock = newBlockCollection;

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
        case LogicalKeyboardKey.enter:
          databaseProps.databaseManager.insertBlockAfter(databaseProps.id);

        // focusNode.nextFocus();
        // focusNode.nextFocus();
        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
