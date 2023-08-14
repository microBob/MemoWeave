import 'dart:ui';

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

  TextNode? textNodeWithTextPosition(TextPosition textPosition) {
    var offsetRemaining = textPosition.offset;
    for (var node in text) {
      if (offsetRemaining - node.text.length > 0) {
        offsetRemaining -= node.text.length;
      } else {
        return node;
      }
    }

    for (var child in children) {
      var childSearch =
          child.textNodeWithTextPosition(TextPosition(offset: offsetRemaining));
      if (childSearch != null) {
        return childSearch;
      }
    }

    return null;
  }
}
