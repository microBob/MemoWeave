import 'package:isar/isar.dart';

part 'text_node.g.dart';

/// An Isar embedded object definition for a formatted piece of text.
@embedded
class TextNode {
  /// Text content.
  String? text;

  // Text format.
  String? format;
}
