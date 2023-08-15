import 'package:isar/isar.dart';

part 'style_node.g.dart';

enum Styles {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  bold,
  italic,
}

/// An Isar embedded object definition for a formatted piece of text.
@embedded
class StyleNode {
  /// Start index in [BlockCollection]'s text that this style applies to.
  final int startIndex;

  /// End index in [BlockCollection]'s text that this style applies to.
  final int endIndex;

  /// Text format.
  @enumerated
  final List<Styles> styles;

  /// Default constructor.
  StyleNode({this.startIndex = 0, this.endIndex = 0, this.styles = const []}) {
    // Verify given range
    if (startIndex > endIndex) {
      throw const FormatException(
          'Invalid range, startIndex ≤ endIndex required.');
    }
  }
}
