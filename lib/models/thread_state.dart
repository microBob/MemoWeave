import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'block_collection_tree_node.dart';
import 'thread_collection.dart';

part 'thread_state.freezed.dart';

/// Thread state.
///
/// Used by the View and handled by the ViewModel.
@freezed
class ThreadState with _$ThreadState {
  /// Thread state.
  ///
  /// Records the Block ID of the Block in focus [idOfBlockInFocus],
  /// global screen position of the caret [caretGlobalPosition],
  /// the caret text offset [caretTextOffset] (negative values wrap from end),
  /// the Thread [threadCollection],
  /// and the child Blocks as with their children
  /// in a tree [blockCollectionTreeNodes].
  const factory ThreadState({
    // Block focus.
    required Id idOfBlockInFocus,

    // Caret state.
    required Offset caretGlobalPosition,
    required int caretTextOffset,

    // Thread and its Blocks.
    required ThreadCollection threadCollection,
    required List<BlockCollectionTreeNode> blockCollectionTreeNodes,
  }) = _ThreadState;
}
