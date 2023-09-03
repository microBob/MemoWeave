import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  }) {
    print('Building block VC ${databaseProps.id}');
    final blockCollection =
        databaseProps.databaseManager.getBlockCollectionById(databaseProps.id);

    if (blockCollection == null) {
      throw FileSystemException(
          'Failed to get Block of ID ${databaseProps.id}');
    }

    blockTextEditingController.rootBlock = blockCollection;
    blockTextEditingController.text = blockCollection.text;

    blockTextEditingController.addListener(handleInput);

    return BlockState(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
      blockCollection: blockCollection,
    );
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() {
    if (!state.blockTextEditingController.selection.isValid) return;
    print(
        'Handling input on Block ${state.blockCollection.id}; text: ${state.blockTextEditingController.text}, selection: ${state.blockTextEditingController.selection}');
    // Create updated rootBlock.
    final newBlockCollection = state.blockCollection
        .copyWith(text: state.blockTextEditingController.text);

    state.blockTextEditingController.rootBlock = newBlockCollection;

    // Write into database.
    state.databaseProps.databaseManager.putBlockCollection(newBlockCollection);

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
          state.databaseProps.databaseManager
              .insertBlockAfter(state.databaseProps.id);

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
