import 'package:isar/isar.dart';
import 'package:memoweave/models/style_node.dart';

part 'block_collection.g.dart';

/// Collection definition for a text block.
@collection
class BlockCollection {
  /// Unique identifier for this block.
  final Id id = Isar.autoIncrement;

  /// Block content as plain text.
  String text = '';

  /// Set if styles to apply onto the text.
  List<StyleNode> styles = [];

  /// Ordered set of hierarchical children to this block.
  final children = IsarLinks<BlockCollection>();

  @Backlink(to: 'children')
  final parents = IsarLinks<BlockCollection>();

  BlockCollection();
}
