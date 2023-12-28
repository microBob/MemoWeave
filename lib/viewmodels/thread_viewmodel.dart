import 'dart:math';

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
    spoolTextEditingController.addListener(onSpoolChanged);

    // Setup subject TextEditingController
    subjectTextEditingController.text = threadCollection.subject;
    subjectTextEditingController.addListener(onSubjectChanged);

    // Return state.
    return ThreadState(
      idOfBlockInFocus: threadCollection.childIds.first,
      caretGlobalPosition: Offset.infinite,
      caretTextOffset: 0,
      threadCollection: threadCollection,
      blockCollectionTreeNodes:
          _createBlockCollectionTreeNodes(threadCollection),
    );
  }

  /// Generate spool dropdown menu entries.
  List<DropdownMenuEntry<String>> spoolsAsDropdownMenuEntries() =>
      databaseProps.databaseManager.spools
          .map((element) => DropdownMenuEntry(value: element, label: element))
          .toList();

  /// Handle updating Thread collection when spool changes.
  ///
  /// Changes state with updated Thread collection.
  void onSpoolChanged() {
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

    // Update state and unfocus Blocks.
    state = state.copyWith(
      idOfBlockInFocus: -1,
      threadCollection: newThread,
    );
  }

  /// Handle updating Thread collection when subject changes.
  ///
  /// Changes state with updated Thread collection.
  void onSubjectChanged() {
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

    // Update state and unfocus Blocks.
    state = state.copyWith(
      idOfBlockInFocus: -1,
      threadCollection: newThread,
    );
  }

  /// Handle traversal keystrokes on blocks.
  ///
  /// Will update state with caret movement and Block focus.
  KeyEventResult onKeyEventCallback(
    FocusNode focusNode,
    KeyEvent keyEvent,
    BlockCallbackProps blockCallbackProps,
  ) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        // Block traversals.

        case LogicalKeyboardKey.arrowUp:
          // Compute position above.
          final positionAbove = blockCallbackProps
              .blockRenderEditable()
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
            caretGlobalPosition: blockCallbackProps
                .blockRenderEditable()
                .localToGlobal(blockCallbackProps
                    .blockRenderEditable()
                    .getLocalRectForCaret(positionAbove)
                    .center),
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowDown:
          // Compute position below.
          final positionBelow = blockCallbackProps
              .blockRenderEditable()
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
            caretGlobalPosition: blockCallbackProps
                .blockRenderEditable()
                .localToGlobal(blockCallbackProps
                    .blockRenderEditable()
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
            caretGlobalPosition: Offset.infinite,
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
            caretGlobalPosition: Offset.infinite,
            caretTextOffset: 0,
          );

          // Mark event as handled.
          return KeyEventResult.handled;

        // Enter, back space, and delete.

        case LogicalKeyboardKey.enter || LogicalKeyboardKey.numpadEnter:
          // Split text between current and next Block.
          final nextBlockCollection = BlockCollection(
            parent: blockCallbackProps.blockCollection.parent,
            text: blockCallbackProps.blockTextEditingController.selection
                .textAfter(blockCallbackProps.blockTextEditingController.text),
          );
          final updatedBlockCollection =
              blockCallbackProps.blockCollection.copyWith(
            text: blockCallbackProps.blockTextEditingController.selection
                .textBefore(blockCallbackProps.blockTextEditingController.text),
          );

          // Insert new Block into parent.
          databaseProps.databaseManager.insertBlockAfter(
            sourceBlockCollection: blockCallbackProps.blockCollection,
            newBlockCollection: nextBlockCollection,
          );

          // Update current Block.
          databaseProps.databaseManager.putBlockCollection(
            updatedBlockCollection,
          );

          // Move focus to first character of next block.
          state = state.copyWith(
            idOfBlockInFocus: databaseProps.databaseManager
                .getIdOfBlockAfter(blockCallbackProps.blockCollection)!,
            caretGlobalPosition: Offset.infinite,
            caretTextOffset: 0,
            blockCollectionTreeNodes: _createBlockCollectionTreeNodes(
              databaseProps.databaseManager
                  .getThreadCollectionById(databaseProps.id),
            ),
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.backspace:
          // Shortcut exit if not at beginning of line.
          if (blockCallbackProps
                  .blockTextEditingController.selection.extentOffset !=
              0) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if first Block in Thread and not empty.
          if (_blocksInThreadById.first ==
                  blockCallbackProps.blockCollection.id &&
              blockCallbackProps.blockTextEditingController.text.isNotEmpty) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if Block is only one in Thread.
          if (_blocksInThreadById.length == 1) {
            return KeyEventResult.ignored;
          }

          // Caret location and focus after backspace.
          var caretTextOffset = -1;
          var idOfBlockInFocus = _blocksInThreadById[max(
            0,
            _blocksInThreadById.indexOf(blockCallbackProps.blockCollection.id) -
                1,
          )];

          // If Block is the first block, move focus to end of next Block.
          if (blockCallbackProps.blockCollection.id ==
              _blocksInThreadById.first) {
            idOfBlockInFocus = _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1];
          } else if (blockCallbackProps
              .blockTextEditingController.text.isNotEmpty) {
            // If not the first Block and there is still text,
            // copy remaining text to previous Block.

            // Get previous Block.
            final previousBlockCollection =
                databaseProps.databaseManager.getBlockCollectionById(
              _blocksInThreadById[_blocksInThreadById
                      .indexOf(blockCallbackProps.blockCollection.id) -
                  1],
            );

            // Copy text to previous Block.
            final updatedPreviousBlockCollection =
                previousBlockCollection.copyWith(
              childIds: previousBlockCollection.childIds.toList()
                ..addAll(blockCallbackProps.blockCollection.childIds),
              text: previousBlockCollection.text +
                  blockCallbackProps.blockTextEditingController.text,
            );

            // Write to database.
            databaseProps.databaseManager
                .putBlockCollection(updatedPreviousBlockCollection);

            // Set caret location to be last character of previous Block.
            caretTextOffset = previousBlockCollection.text.length;
          }

          // Delete current Block.
          databaseProps.databaseManager.deleteBlockCollection(
            blockCallbackProps.blockCollection,
          );

          // Move focus to previous Block
          // (could be first Block in Thread).
          state = state.copyWith(
            idOfBlockInFocus: idOfBlockInFocus,
            caretGlobalPosition: Offset.infinite,
            caretTextOffset: caretTextOffset,
            blockCollectionTreeNodes: _createBlockCollectionTreeNodes(
              databaseProps.databaseManager
                  .getThreadCollectionById(databaseProps.id),
            ),
          );

          // Mark event as handled.
          return KeyEventResult.handled;
        case LogicalKeyboardKey.delete:
          // Shortcut exit if not at end of line.
          if (blockCallbackProps
                  .blockTextEditingController.selection.extentOffset !=
              blockCallbackProps.blockTextEditingController.text.length) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if last Block in Thread.
          if (_blocksInThreadById.last ==
              blockCallbackProps.blockCollection.id) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if Block is only one in Thread.
          if (_blocksInThreadById.length == 1) {
            return KeyEventResult.ignored;
          }

          // Get next Block.
          final nextBlockCollection =
              databaseProps.databaseManager.getBlockCollectionById(
            _blocksInThreadById[_blocksInThreadById
                    .indexOf(blockCallbackProps.blockCollection.id) +
                1],
          );

          // Update current Block with next Block's text and children.
          final updatedBlockCollection =
              blockCallbackProps.blockCollection.copyWith(
            childIds: blockCallbackProps.blockCollection.childIds.toList()
              ..addAll(nextBlockCollection.childIds),
            text: blockCallbackProps.blockTextEditingController.text +
                nextBlockCollection.text,
          );

          // Delete next Block.
          databaseProps.databaseManager.deleteBlockCollection(
            nextBlockCollection,
          );

          // Put in updated current Block.
          databaseProps.databaseManager.putBlockCollection(
            updatedBlockCollection,
          );

          // Update Block collection tree and maintain caret position.
          state = state.copyWith(
            idOfBlockInFocus: blockCallbackProps.blockCollection.id,
            caretGlobalPosition: Offset.infinite,
            caretTextOffset: blockCallbackProps
                .blockTextEditingController.selection.extentOffset,
            blockCollectionTreeNodes: _createBlockCollectionTreeNodes(
              databaseProps.databaseManager
                  .getThreadCollectionById(databaseProps.id),
            ),
          );

          // Mark event as handled.
          return KeyEventResult.handled;
      }
    }

    // Otherwise, mark event as ignored.
    return KeyEventResult.ignored;
  }

  /// Initialize Block's focus and caret state.
  ///
  /// Does not change Thread state.
  void initBlockFocusAndCaret(
    FocusNode focusNode,
    BlockCallbackProps blockCallbackProps,
  ) {
    // Shortcut exit if not supposed to be in focus.
    if (state.idOfBlockInFocus != blockCallbackProps.blockCollection.id) {
      return;
    }

    // Should have focus, so grab it.
    focusNode.requestFocus();

    // If caret's global position is infinite, use the text offset.
    if (state.caretGlobalPosition == Offset.infinite) {
      // Special case:
      // A negative values indicates some value from the end of the text.
      if (state.caretTextOffset < 0) {
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.collapsed(
          offset: blockCallbackProps.blockTextEditingController.text.length +
              state.caretTextOffset +
              1,
        );
      } else {
        // Normal case, set from given offset
        blockCallbackProps.blockTextEditingController.selection =
            TextSelection.collapsed(offset: state.caretTextOffset);
      }
    } else {
      // Otherwise, set from the the caret's global position.
      blockCallbackProps.blockTextEditingController.selection =
          TextSelection.fromPosition(
        blockCallbackProps
            .blockRenderEditable()
            .getPositionForPoint(state.caretGlobalPosition),
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
        childBlocks:
            currentBlock.childIds.map(createBlockCollectionTree).toList(),
      );
    }

    // Create the list of trees.
    return threadCollection.childIds.map(createBlockCollectionTree).toList();
  }
}
