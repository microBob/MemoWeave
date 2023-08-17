import 'package:isar/isar.dart';
import 'package:memoweave/models/style_node.dart';

part 'block_collection.g.dart';

enum BlockStyle {
  normal,
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
}

/// Collection definition for a text block.
@collection
class BlockCollection {
  /// Unique identifier for this block.
  final Id id = Isar.autoIncrement;

  /// Block content as plain text.
  String text = '';

  /// Block base style
  @enumerated
  BlockStyle blockStyle = BlockStyle.normal;

  /// Inline styles to apply onto the text.
  ///
  /// Requirement: nodes do not overlap their responsible regions and
  /// nodes are stored in ascending index order.
  List<StyleNode> inlineStyles = [];

  /// Ordered set of hierarchical children to this block.
  final children = IsarLinks<BlockCollection>();

  @Backlink(to: 'children')
  final parents = IsarLinks<BlockCollection>();

  BlockCollection();
}
