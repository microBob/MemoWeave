import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
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
    required BlockProps props,
    required BlockTextEditingController blockTextEditingController,
  }) {
    blockTextEditingController.rootBlock = props.blockCollection;
    blockTextEditingController.text = props.blockCollection.text;

    blockTextEditingController.addListener(handleInput);

    return props.blockCollection;
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  Future<void> handleInput() async {
    // Create updated rootBlock.
    final newRootBlock = state.copyWith(text: blockTextEditingController.text);

    blockTextEditingController.rootBlock = newRootBlock;

    // Write into database.
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putBlockCollection(newRootBlock);

    state = newRootBlock;
  }

  Future<KeyEventResult> handleEditorTraversal(
      FocusNode focusNode, KeyEvent keyEvent) async {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          focusNode.nextFocus();
          focusNode.nextFocus();
        case LogicalKeyboardKey.arrowUp:
          focusNode.previousFocus();
          focusNode.previousFocus();
        case LogicalKeyboardKey.enter:
          final databaseManager =
              await ref.read(databaseManagerProvider.future);
          print('Got DMP');
          print('Num parents: ${state.parents.length}');
          for (final parent in state.parents) {
            final blocks = parent.children.toList();
            print('Got parent children');
            blocks.insert(blocks.indexWhere((block) => block.id == state.id),
                BlockCollection());
            print('Inserted into children list');
            final newParent = parent.copyWith(children: blocks);
            print('created new parent');
            databaseManager.putBlockCollection(newParent);
            print('Put parent back');
          }
          if (state.parents.isNotEmpty) {
            ref.invalidate(blockViewModelProvider);
          }
          print('Num Threads: ${state.threads.length}');
          for (final thread in state.threads) {
            final blocks = thread.blocks.toList();
            print('Got thread blocks: $blocks');
            print(
                'Insert index: ${blocks.indexWhere((block) => block.id == state.id) + 1}');
            blocks.insert(
                blocks.indexWhere((block) => block.id == state.id) + 1,
                BlockCollection());
            print('Inserted into blocks list: $blocks');
            final newThread = thread.copyWith(blocks: blocks);
            print('Created new Thread');
            databaseManager.putThreadCollection(newThread);
            print('Put thread back');
          }
          if (state.threads.isNotEmpty) {
            ref.invalidate(threadViewModelProvider);
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
