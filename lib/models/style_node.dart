import 'package:isar/isar.dart';

part 'style_node.g.dart';

enum InlineStyle {
  bold,
  italic,
}

/// An Isar embedded object definition for a formatted piece of text.
@embedded
class StyleNode {
  /// First index in [BlockCollection]'s text that this style applies to.
  final int startIndex;

  /// Index after the last character in [BlockCollection]'s text that this
  /// style applies to.
  final int endIndex;

  /// Text format.
  @enumerated
  final List<InlineStyle> styles;

  /// Default constructor.
  StyleNode({this.startIndex = 0, this.endIndex = 0, this.styles = const []}) {
    // Verify given range
    if (startIndex > endIndex) {
      throw const FormatException(
          'Invalid range, startIndex ≤ endIndex required.');
    }
  }
}
