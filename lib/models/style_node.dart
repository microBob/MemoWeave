import 'package:isar/isar.dart';

part 'style_node.g.dart';

/// Styles on inline text.
enum InlineStyle {
  /// Bold text styling
  bold,

  /// Italic text styling
  italic,
}

/// An [Isar] embedded object definition for a formatted piece of text.
@embedded
class StyleNode {
  /// First index in a Block's text that this style applies to.
  ///
  /// Requirement: 0 ≤ [startIndex] < [endIndex].
  final int startIndex;

  /// Index after the last character in a Block's text that this
  /// style applies to.
  ///
  /// Requirement: [startIndex] < [endIndex] ≤ text length (unverifiable).
  final int endIndex;

  /// Text formats.
  ///
  /// Requirement: No repeated style. Treat like a set.
  @enumerated
  final List<InlineStyle> styles;

  /// Default constructor.
  ///
  /// Defines [startIndex], [endIndex], and [styles].
  /// Provides defaults if values are not provided.
  /// Throws [FormatException] on invalid input.
  StyleNode({
    this.startIndex = 0,
    this.endIndex = 0,
    this.styles = const [],
  }) {
    // Verify startIndex range.
    if (0 <= startIndex && startIndex < endIndex) {
      throw const FormatException('Invalid StyleNode startIndex. '
          'Expected range: 0 ≤ startIndex < endIndex.');
    }

    // Verify endIndex range.
    if (startIndex < endIndex) {
      throw const FormatException('Invalid endIndex. '
          'Expected StyleNode range: startIndex < endIndex.');
    }

    // Verify no duplicate styles.
    if (styles.length > styles.toSet().length) {
      throw const FormatException(
          'Invalid StyleNode styles list. Must not contain duplicate styles.');
    }
  }

  /// Copy builder.
  ///
  /// Creates a copy of the current style node and updates
  /// [startIndex] to [newStartIndex], [endIndex] to [newEndIndex],
  /// and [styles] to [newStyles] when provided.
  StyleNode copyWith({
    int? newStartIndex,
    int? newEndIndex,
    List<InlineStyle>? newStyles,
  }) =>
      StyleNode(
        startIndex: newStartIndex ?? startIndex,
        endIndex: newEndIndex ?? endIndex,
        styles: newStyles ?? styles,
      );

  /// Check if this style node is overlapping with another.
  ///
  /// Returns true if other's [startIndex] or [endIndex] is within this node's
  /// bounds or if this node is within [other]'s bounds.
  bool isOverlappingWith(StyleNode other) =>
      (startIndex <= other.startIndex && other.startIndex < endIndex) ||
      (startIndex <= other.endIndex && other.endIndex < endIndex) ||
      (other.startIndex <= startIndex && endIndex <= other.endIndex);

  /// Determines if this style node ends before [other] begins.
  bool operator <(StyleNode other) => endIndex <= other.startIndex;

  /// Determines if this style node starts after [other] ends.
  bool operator >(StyleNode other) => startIndex >= other.endIndex;
}
