import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/thread_collection.dart';

import 'block_collection_tree_node.dart';

part 'thread_state.freezed.dart';

/// Thread state.
///
/// Records the Block ID of the Block in focus [idOfBlockInFocus],
/// the caret text offset [caretTextOffset] (negative values wrap from end),
/// global screen position of the caret [caretGlobalPosition],
/// the Thread's date and time [dateTime],
/// and the child Blocks as with their children
/// in a tree [blockCollectionTreeNodes].
@freezed
class ThreadState with _$ThreadState {
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
