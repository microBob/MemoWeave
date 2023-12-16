import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'block_collection_tree_node.dart';

part 'thread_state.freezed.dart';

enum TraverseDirection {
  none,
  fromBottom,
  fromTop,
}

@freezed
class ThreadState with _$ThreadState {
  const factory ThreadState({
    required Id idOfBlockInFocus,
    required TraverseDirection traversingBlocks,
    required int caretPosition,
    required Rect caretRect,
    required DateTime dateTime,
    required List<BlockCollectionTreeNode> blockCollectionTreeNodes,
  }) = _ThreadState;
}
