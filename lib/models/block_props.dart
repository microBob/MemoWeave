import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection_tree_node.dart';

part 'block_props.freezed.dart';

/// Properties to be passed to [BlockViewModel].
@freezed
class BlockProps with _$BlockProps {
  const factory BlockProps({
    required BlockCollectionTreeNode blockCollectionTreeNode,
    required Id idOfBlockInFocus,
    required KeyEventResult Function(FocusNode, KeyEvent)
        onEditorTraversalCallback,
  }) = _BlockProps;
}
