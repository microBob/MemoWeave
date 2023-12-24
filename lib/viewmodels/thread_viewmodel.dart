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
    spoolTextEditingController.addListener(spoolChanged);

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
      caretTextOffset: 0,
      caretGlobalPosition: Offset.zero,
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
  void spoolChanged() {
    // Shortcut exit on only selection changes.
    if (spoolTextEditingController.text == state.threadCollection.spool) {
      return;
    }

    // Create new Thread with updated subject.
    final newThread = state.threadCollection.copyWith(
      spool: spoolTextEditingController.text,
    );

    // Write to database.
    databaseProps.databaseManager.putThreadCollection(newThread);

    // Update state.
    state = state.copyWith(
      threadCollection: newThread,
    );
  }

  /// Handle updating Thread collection when subject changes.
  void subjectChanged() {
    // Shortcut exit on only selection changes.
    if (subjectTextEditingController.text == state.threadCollection.subject) {
      return;
    }

    // Create new Thread with updated subject.
    final newThread = state.threadCollection.copyWith(
      subject: subjectTextEditingController.text,
    );

    // Write to database.
    databaseProps.databaseManager.putThreadCollection(newThread);

    // Update state.
    state = state.copyWith(
      threadCollection: newThread,
    );
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

          // Otherwise, move focus to previous block and update caret state.
          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) -
                1],
            traversingBlocks: true,
            caretTextOffset: positionAbove.offset,
            caretGlobalPosition: blockCallbackProps.blockRenderEditable
                .localToGlobal(blockCallbackProps.blockRenderEditable
                    .getLocalRectForCaret(positionAbove)
                    .center),
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

          // Otherwise, move focus to next block and update caret state.
          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1],
            traversingBlocks: true,
            caretTextOffset: positionBelow.offset,
            caretGlobalPosition: blockCallbackProps.blockRenderEditable
                .localToGlobal(blockCallbackProps.blockRenderEditable
                    .getLocalRectForCaret(positionBelow)
                    .center),
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
          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) -
                1],
            traversingBlocks: true,
            caretTextOffset: -1,
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
          state = state.copyWith(
            idOfBlockInFocus: _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1],
            traversingBlocks: true,
            caretTextOffset: 0,
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
      // Set selection based on state.
      if (state.caretTextOffset == 0) {
        // A zero value indicates the beginning of the text.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          const TextPosition(offset: 0),
        );
      } else if (state.caretTextOffset < 0) {
        // A negative values indicates some value from the end of the text.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          TextPosition(
            offset: blockCallbackProps.blockTextEditingController.text.length +
                state.caretTextOffset +
                1,
          ),
        );
      } else {
        // Otherwise, set from the the caret's global position.
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.fromPosition(
          blockCallbackProps.blockRenderEditable
              .getPositionForPoint(state.caretGlobalPosition),
        );
      }

      // Update caret state info and acknowledge traversal.
      state = state.copyWith(
        traversingBlocks: false,
      );
    } else if (state.idOfBlockInFocus !=
        blockCallbackProps.blockCollection.id) {
      // If we got here from a different block, update state.
      state = state.copyWith(
        idOfBlockInFocus: blockCallbackProps.blockCollection.id,
      );
    }
  }

  /// Handle saving new input in a block.
  void onBlockTextEditingControllerChangedCallback(
    BlockCollection blockCollection,
    BlockTextEditingController blockTextEditingController,
  ) {
    // Shortcut exit if no changes to text.
    if (blockTextEditingController.text == blockCollection.text) {
      return;
    }

    // Otherwise, Create a new block with updates.
    final newBlock = blockCollection.copyWith(
      text: blockTextEditingController.text,
    );

    // Write to database.
    databaseProps.databaseManager.putBlockCollection(newBlock);
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
