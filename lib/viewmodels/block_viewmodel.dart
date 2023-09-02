import 'dart:io';

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
  }) {
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
          final blockParents = state.databaseProps.databaseManager
              .getParentBlocksOfBlock(state.databaseProps.id);
          final threadParents = state.databaseProps.databaseManager
              .getParentThreadsOfBlock(state.databaseProps.id);

          final newBlock = BlockCollection();

          print('Block parents: ${blockParents.length}');
          for (final blockParent in blockParents) {
            final childBlockIds = blockParent.childrenBlockIds;
            childBlockIds.insert(
              childBlockIds.indexOf(state.databaseProps.id) + 1,
              newBlock.id,
            );

            final newBlockParent =
                blockParent.copyWith(childrenBlockIds: childBlockIds);
            state.databaseProps.databaseManager
                .putBlockCollection(newBlockParent);
          }

          print('Thread parents: ${threadParents.length}');
          for (final threadParent in threadParents) {
            final blockIds = threadParent.blockIds;
            blockIds.insert(
                blockIds.indexOf(state.databaseProps.id), newBlock.id);

            final newThreadParent = threadParent.copyWith(blockIds: blockIds);
            state.databaseProps.databaseManager
                .putThreadCollection(newThreadParent);
          }
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
