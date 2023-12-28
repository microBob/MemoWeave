import 'package:freezed_annotation/freezed_annotation.dart';

import 'block_collection.dart';

part 'block_collection_tree_node.freezed.dart';

/// A node the tree representation of a Block and its children.
@freezed
class BlockCollectionTreeNode with _$BlockCollectionTreeNode {
  /// Constructor for a BlockCollectionTreeNode.
  ///
  /// [blockCollection] this node represents.
  /// the [childBlocks] of this Block as a list of nodes.
  const factory BlockCollectionTreeNode({
    required BlockCollection blockCollection,
    required List<BlockCollectionTreeNode> childBlocks,
  }) = _BlockCollectionTreeNode;
}
