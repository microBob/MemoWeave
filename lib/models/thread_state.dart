import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'block_collection_tree_node.dart';

part 'thread_state.freezed.dart';

@freezed
class ThreadState with _$ThreadState {
  const factory ThreadState({
    required Id idOfBlockInFocus,
    required int caretPosition,
    required DateTime dateTime,
    required List<BlockCollectionTreeNode> blockCollectionTreeNodes,
  }) = _ThreadState;
}
