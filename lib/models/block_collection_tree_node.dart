import 'package:freezed_annotation/freezed_annotation.dart';

import 'block_collection.dart';

part 'block_collection_tree_node.freezed.dart';

@freezed
class BlockCollectionTreeNode with _$BlockCollectionTreeNode {
  const factory BlockCollectionTreeNode({
    required BlockCollection blockCollection,
    required List<BlockCollectionTreeNode> childBlocks,
  }) = _BlockCollectionTreeNode;
}
