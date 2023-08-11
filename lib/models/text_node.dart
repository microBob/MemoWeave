import 'package:isar/isar.dart';

part 'text_node.g.dart';

/// An Isar embedded object definition for a formatted piece of text.
@embedded
class TextNode {
  /// Text content.
  String text = '';

  /// Text format.
  String format = '';

  /// Default constructor.
  TextNode();

  /// Construct a node with the supplied text and no text formatting.
  TextNode.plain({required this.text});
}
