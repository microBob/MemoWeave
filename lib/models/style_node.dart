import 'package:isar/isar.dart';

part 'style_node.g.dart';

/// An Isar embedded object definition for a formatted piece of text.
@embedded
class StyleNode {
  /// Start index in [BlockCollection]'s text that this style applies to.
  int startIndex = 0;

  /// End index in [BlockCollection]'s text that this style applies to.
  int endIndex = 0;

  /// Text format.
  String format = '';

  /// Default constructor.
  StyleNode();
}
