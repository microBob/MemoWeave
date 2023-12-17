import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_callback_props.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/block_collection_tree_node.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/models/thread_state.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/caret_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_viewmodel.g.dart';

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
@riverpod
class ThreadViewModel extends _$ThreadViewModel {
  /// Ordered list of blocks by ID.
  List<Id> _blocksInThreadById = [];

  @override
  ThreadState build({
    required final DatabaseProps databaseProps,
    required final TextEditingController spoolTextEditingController,
    required final TextEditingController subjectTextEditingController,
  }) {
    final threadCollection =
        databaseProps.databaseManager.getThreadCollectionById(databaseProps.id);

    // Setup spool TextEditingController
    spoolTextEditingController.text = threadCollection.spool;
    spoolTextEditingController.addListener(spoolSelectionChanged);

    // Setup subject TextEditingController
    subjectTextEditingController.text = threadCollection.subject;
    subjectTextEditingController.addListener(subjectChanged);

    // Subscribe to changes on the Thread collection and update state
    // databaseProps.databaseManager.onThreadChanged(databaseProps.id).listen(
    //   (threadCollection) {
    //     // Shortcut exit if null.
    //     if (threadCollection == null) return;
    //
    //     // Update state if datetime or direct child IDs have changed.
    //     if (threadCollection.dateTime != threadCollection.dateTime ||
    //         threadCollection.childIds != threadCollection.childIds) {
    //       state = state.copyWith(
    //         threadCollection: threadCollection,
    //         blockCollectionTreeNodes:
    //             _createBlockCollectionTreeNodes(threadCollection),
    //       );
    //     }
    //
    //     // Update cache.
    //     _threadCollectionCache = threadCollection;
    //   },
    // );

    // Return state.
    return ThreadState(
      idOfBlockInFocus: threadCollection.childIds.first,
      traversingBlocks: false,
      threadCollection: threadCollection,
      blockCollectionTreeNodes:
          _createBlockCollectionTreeNodes(threadCollection),
    );
  }

  /// Generate spool dropdown menu entries.
  List<DropdownMenuEntry> spoolsAsDropdownMenuEntries() {
    return databaseProps.databaseManager.spools
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  /// Handle updating Thread collection when spool changes.
  void spoolSelectionChanged() {
    if (!spoolTextEditingController.selection.isValid) return;
    // Create new Thread.
    final newThread = state.threadCollection.copyWith(
      spool: spoolTextEditingController.text,
    );

    // Write to database.
    databaseProps.databaseManager.putThreadCollection(newThread);

    // Update provider.
    ref.invalidateSelf();
  }

  /// Handle updating Thread collection when subject changes.
  void subjectChanged() {
    // Create new Thread
    final newThread = state.threadCollection.copyWith(
      subject: subjectTextEditingController.text,
    );

    // Write to database
    databaseProps.databaseManager.putThreadCollection(newThread);

    // Update provider.
    ref.invalidateSelf();
  }

  /// Handle traversal keystrokes on blocks.
  KeyEventResult onKeyEventCallback(
    KeyEvent keyEvent,
    BlockCallbackProps blockCallbackProps,
  ) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          // Compute position above.
          final positionAbove = blockCallbackProps.blockRenderEditable
              .getTextPositionAbove(blockCallbackProps
                  .blockTextEditingController.selection.extent);

          // Shortcut exit if not on first line.
          if (positionAbove.offset !=
              blockCallbackProps
                  .blockTextEditingController.selection.extentOffset) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if block is first in thread.
          if (_blocksInThreadById.first ==
              blockCallbackProps.blockCollection.id) {
            return KeyEventResult.ignored;
          }

          // Otherwise, update caret global location and move focus to
          // previous block.

          ref.read(caretViewModelProvider.notifier).update(
                caretGlobalPosition:
                    blockCallbackProps.blockRenderEditable.localToGlobal(
                  blockCallbackProps.blockRenderEditable
                      .getLocalRectForCaret(positionAbove)
                      .center,
                ),
              );

          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) -
                1],
            traversingBlocks: true,
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowDown:
          // Compute position below.
          final positionBelow = blockCallbackProps.blockRenderEditable
              .getTextPositionBelow(blockCallbackProps
                  .blockTextEditingController.selection.extent);

          // Shortcut exit if not on last line.
          if (positionBelow.offset !=
              blockCallbackProps
                  .blockTextEditingController.selection.extentOffset) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if block is last in thread.
          if (_blocksInThreadById.last ==
              blockCallbackProps.blockCollection.id) {
            return KeyEventResult.ignored;
          }

          // Otherwise, update caret global location and move focus to
          // previous block.

          ref.read(caretViewModelProvider.notifier).update(
                caretGlobalPosition:
                    blockCallbackProps.blockRenderEditable.localToGlobal(
                  blockCallbackProps.blockRenderEditable
                      .getLocalRectForCaret(positionBelow)
                      .center,
                ),
              );

          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1],
            traversingBlocks: true,
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          // Shortcut exit if not at beginning of line.
          if (blockCallbackProps
                  .blockTextEditingController.selection.extentOffset !=
              0) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if block is first in thread.
          if (_blocksInThreadById.first ==
              blockCallbackProps.blockCollection.id) {
            return KeyEventResult.ignored;
          }

          // Otherwise, move focus to last character of previous block.

          ref.read(caretViewModelProvider.notifier).update(caretTextOffset: -1);

          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) -
                1],
            traversingBlocks: true,
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
          // Shortcut exit if not at end of line.
          if (blockCallbackProps
                  .blockTextEditingController.selection.extentOffset !=
              blockCallbackProps.blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if block is last in thread.
          if (_blocksInThreadById.last ==
              blockCallbackProps.blockCollection.id) {
            return KeyEventResult.ignored;
          }

          // Otherwise, move focus to first character of next block.

          ref.read(caretViewModelProvider.notifier).update(caretTextOffset: 0);

          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1],
            traversingBlocks: true,
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.enter || LogicalKeyboardKey.numpadEnter:
        // Split text between current and next Block.
      }
    }

    // Otherwise, mark event as ignored.
    return KeyEventResult.ignored;
  }

  /// Handle block gaining focus.
  void onFocusChangedCallback(
    bool gainsFocus,
    BlockCallbackProps blockCallbackProps,
  ) {
    // Shortcut exit if losing focus.
    if (!gainsFocus) return;

    // Handle traversing blocks.
    if (state.idOfBlockInFocus == blockCallbackProps.blockCollection.id &&
        state.traversingBlocks) {
      final caretState = ref.read(caretViewModelProvider);
      // Set selection based on state.
      if (caretState.caretTextOffset == 0) {
        // A zero value indicates the beginning of the text.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          const TextPosition(offset: 0),
        );
      } else if (caretState.caretTextOffset < 0) {
        // A negative values indicates some value from the end of the text.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          TextPosition(
            offset: blockCallbackProps.blockTextEditingController.text.length +
                caretState.caretTextOffset +
                1,
          ),
        );
      } else {
        // Otherwise, set from the the caret's global position.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          blockCallbackProps.blockRenderEditable
              .getPositionForPoint(caretState.caretGlobalPosition),
        );
      }

      // Update caret state info and acknowledge traversal.

      ref.read(caretViewModelProvider.notifier).update(
            caretTextOffset: blockCallbackProps
                .blockTextEditingController.selection.extentOffset,
            caretGlobalPosition:
                blockCallbackProps.blockRenderEditable.localToGlobal(
              blockCallbackProps.blockRenderEditable
                  .getLocalRectForCaret(blockCallbackProps
                      .blockTextEditingController.selection.extent)
                  .center,
            ),
          );

      state = state.copyWith(
        traversingBlocks: false,
      );
    } else if (state.idOfBlockInFocus !=
        blockCallbackProps.blockCollection.id) {
      // If we got here from a different block, update state.
      state = state.copyWith(
          idOfBlockInFocus: blockCallbackProps.blockCollection.id);
    }
  }

  /// Handle saving new input in a block.
  void onBlockTextEditingControllerChangedCallback(
    BlockCollection blockCollection,
    BlockTextEditingController blockTextEditingController,
  ) {
    // Update block if changed.
    if (blockTextEditingController.text != blockCollection.text) {
      // Create new block.
      final newBlock = blockCollection.copyWith(
        text: blockTextEditingController.text,
      );

      // Write to database.
      databaseProps.databaseManager.putBlockCollection(newBlock);
    }

    // Update caret position if valid and changed.
    if (blockTextEditingController.selection.isValid &&
        blockTextEditingController.selection.extentOffset !=
            ref.read(caretViewModelProvider).caretTextOffset) {
      ref.read(caretViewModelProvider.notifier).update(
            caretTextOffset: blockTextEditingController.selection.extentOffset,
          );
    }
  }

  /// Build the list of [BlockCollectionTreeNode] for
  /// a given [threadCollection].
  List<BlockCollectionTreeNode> _createBlockCollectionTreeNodes(
      ThreadCollection threadCollection) {
    // Reset list thread's list of block IDs.
    _blocksInThreadById = [];

    // Create the [BlockCollectionTreeNode] for a given [blockId].
    BlockCollectionTreeNode createBlockCollectionTree(Id blockId) {
      // Add Id to the list of Block IDs.
      _blocksInThreadById.add(blockId);

      // Get current Block's Collection
      final currentBlock =
          databaseProps.databaseManager.getBlockCollectionById(blockId);

      // Return the BlockCollectionTreeNode and recurse on children.
      return BlockCollectionTreeNode(
        blockCollection: currentBlock,
        childBlocks: currentBlock.childIds
            .map((childId) => createBlockCollectionTree(childId))
            .toList(),
      );
    }

    // Create the list of trees.
    return threadCollection.childIds
        .map((childId) => createBlockCollectionTree(childId))
        .toList();
  }
}
