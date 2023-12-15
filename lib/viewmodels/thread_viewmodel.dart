import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
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
  /// Local cache of the Thread Collection data.
  late ThreadCollection _threadCollectionCache;

  /// Ordered list of blocks by ID.
  List<Id> _blocksInThreadById = [];

  @override
  ThreadState build({
    required final DatabaseProps databaseProps,
    required final TextEditingController spoolTextEditingController,
    required final TextEditingController subjectTextEditingController,
  }) {
    _threadCollectionCache =
        databaseProps.databaseManager.getThreadCollectionById(databaseProps.id);

    // Set initial spool.
    spoolTextEditingController.text = _threadCollectionCache.spool;

    // Add listener to spool changes.
    spoolTextEditingController.addListener(spoolSelectionChanged);

    // Set initial subject.
    subjectTextEditingController.text = _threadCollectionCache.subject;

    // Add listener to subject changes.
    subjectTextEditingController.addListener(subjectChanged);

    // Subscribe to changes on the Thread collection and update state
    databaseProps.databaseManager.onThreadChanged(databaseProps.id).listen(
      (threadCollection) {
        // Shortcut exit if null.
        if (threadCollection == null) return;

        // Update state if datetime or direct child IDs have changed.
        if (threadCollection.dateTime != _threadCollectionCache.dateTime ||
            threadCollection.childIds != _threadCollectionCache.childIds) {
          state = state.copyWith(
            dateTime: threadCollection.dateTime,
            blockCollectionTreeNodes:
                _createBlockCollectionTreeNodes(threadCollection),
          );
        }

        // Update cache.
        _threadCollectionCache = threadCollection;
      },
    );

    // Return state.
    return ThreadState(
      idOfBlockInFocus: _threadCollectionCache.childIds.first,
      caretPosition: 0,
      dateTime: _threadCollectionCache.dateTime,
      blockCollectionTreeNodes:
          _createBlockCollectionTreeNodes(_threadCollectionCache),
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
    _threadCollectionCache = _threadCollectionCache.copyWith(
      spool: spoolTextEditingController.text,
    );

    // Write to database.
    databaseProps.databaseManager.putThreadCollection(_threadCollectionCache);
  }

  /// Handle updating Thread collection when subject changes.
  void subjectChanged() {
    // Create new Thread
    _threadCollectionCache = _threadCollectionCache.copyWith(
      subject: subjectTextEditingController.text,
    );

    // Write to database
    databaseProps.databaseManager.putThreadCollection(_threadCollectionCache);
  }

  /// Handle traversal keystrokes on blocks.
  KeyEventResult onKeyEventCallback(
    FocusNode focusNode,
    KeyEvent keyEvent,
    Id blockId,
    RenderEditable blockRenderEditable,
    BlockTextEditingController blockTextEditingController,
  ) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          // Compute position above.
          final positionAbove = blockRenderEditable.getTextPositionAbove(
              blockTextEditingController.selection.extent);

          // Shortcut exit if not on first line.
          if (positionAbove.offset !=
              blockTextEditingController.selection.extentOffset) {
            return KeyEventResult.ignored;
          }

          // Shortcut exit if block is first in thread.
          if (_blocksInThreadById.first == blockId) {
            return KeyEventResult.ignored;
          }

          // Otherwise, move focus to previous block.
          state = state.copyWith(
            idOfBlockInFocus:
                _blocksInThreadById[_blocksInThreadById.indexOf(blockId) - 1],
          );
      }
    }
    return KeyEventResult.ignored;
  }

  /// Handle block gaining focus.
  void onFocusChangedCallback(bool gainsFocus, Id blockId) {
    // Shortcut exit if losing focus.
    if (!gainsFocus) return;

    // Shortcut exit if block is already marked as in focus.
    if (state.idOfBlockInFocus == blockId) return;

    // Update state.
    state = state.copyWith(idOfBlockInFocus: blockId);
  }

  /// Handle saving new input in a block.
  void onBlockTextEditingControllerChangedCallback(
    BlockTextEditingController blockTextEditingController,
    Id blockId,
  ) {
    // Get block from database.
    final block = databaseProps.databaseManager.getBlockCollectionById(blockId);

    // Update block if changed.
    if (blockTextEditingController.text != block.text) {
      // Create new block.
      final newBlock = block.copyWith(text: blockTextEditingController.text);

      // Write to database.
      databaseProps.databaseManager.putBlockCollection(newBlock);
    }

    // Update caret position if valid and changed.
    if (blockTextEditingController.selection.isValid &&
        blockTextEditingController.selection.baseOffset !=
            state.caretPosition) {
      state = state.copyWith(
          caretPosition: blockTextEditingController.selection.extentOffset);
    }
  }

  /// Build the list of [BlockCollectionTreeNode] for
  /// a given [threadCollection].
  List<BlockCollectionTreeNode> _createBlockCollectionTreeNodes(
      ThreadCollection threadCollection) {
    // Reset list thread's list of block IDs.
    _blocksInThreadById = [];

    // Create the list of trees.
    return threadCollection.childIds
        .map((childId) => _createBlockCollectionTree(childId))
        .toList();
  }

  /// Create the [BlockCollectionTreeNode] for a given [blockId].
  BlockCollectionTreeNode _createBlockCollectionTree(Id blockId) {
    // Add Id to the list of Block IDs.
    _blocksInThreadById.add(blockId);

    // Get current Block's Collection
    final currentBlock =
        databaseProps.databaseManager.getBlockCollectionById(blockId);

    // Return the BlockCollectionTreeNode and recurse on children.
    return BlockCollectionTreeNode(
      blockCollection: currentBlock,
      childBlocks: currentBlock.childIds
          .map((childId) => _createBlockCollectionTree(childId))
          .toList(),
    );
  }
}
