import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            blockCollectionTreeNodes: threadCollection.childIds
                .map((childIds) => _createBlockCollectionTree(childIds))
                .toList(),
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
      blockCollectionTreeNodes: _threadCollectionCache.childIds
          .map((childIds) => _createBlockCollectionTree(childIds))
          .toList(),
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
  KeyEventResult onEditorTraversalCallback(
    FocusNode focusNode,
    KeyEvent keyEvent,
    RenderEditable renderEditable,
  ) {
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

  /// Create the [BlockCollectionTreeNode] for a given [blockId].
  BlockCollectionTreeNode _createBlockCollectionTree(Id blockId) {
    final currentBlock =
        databaseProps.databaseManager.getBlockCollectionById(blockId);
    return BlockCollectionTreeNode(
      blockCollection: currentBlock,
      childBlocks: currentBlock.childIds
          .map((childIds) => _createBlockCollectionTree(childIds))
          .toList(),
    );
  }
}
