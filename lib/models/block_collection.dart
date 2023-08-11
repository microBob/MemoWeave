import 'package:isar/isar.dart';
import 'package:memoweave/models/text_node.dart';

part 'block_collection.g.dart';

/// Collection definition for a text block.
@collection
class BlockCollection {
  /// Unique identifier for this block.
  final Id id = Isar.autoIncrement;

  /// Text that comprise the contents of this block.
  List<TextNode> text = [];

  /// Ordered set of hierarchical children to this block.
  final children = IsarLinks<BlockCollection>();

  BlockCollection();
}
