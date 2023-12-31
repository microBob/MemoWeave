import 'package:isar/isar.dart';

import 'container_model.dart';
import 'style_node.dart';

part 'block_collection.g.dart';

/// Styles that affect the whole block.
enum BlockStyle {
  /// No style (plain text).
  none,

  /// Heading 1 style.
  heading1,

  /// Heading 2 style.
  heading2,

  /// Heading 3 style.
  heading3,

  /// Heading 4 style.
  heading4,

  /// Heading 5 style.
  heading5,

  /// Heading 6 style.
  heading6,
}

/// Collection definition for a text block.
@collection
class BlockCollection extends ParentModel {
  /// Parent ID reference.
  final int parent;

  /// Whether the parent is a Thread.
  final bool hasThreadAsParent;

  /// Block content.
  final String text;

  /// Block base style.
  ///
  /// Applies to the whole block in addition to any [InlineStyle] objects.
  @enumerated
  final BlockStyle blockStyle;

  /// Inline styles to apply onto the text.
  ///
  /// Requirement: nodes do not overlap their responsible regions,
  /// nodes are stored in ascending index order,
  /// and the responsible regions are within the text length.
  final List<StyleNode> inlineStyles;

  /// Default constructor.
  ///
  /// Defines [id], [text], [blockStyle], and [inlineStyles].
  /// Will supply default values if none are given.
  /// Throws [FormatException] on invalid input.
  BlockCollection({
    super.id = Isar.autoIncrement,
    super.childIds = const [],
    required this.parent,
    this.hasThreadAsParent = true,
    this.text = 'Blank state text',
    this.blockStyle = BlockStyle.none,
    this.inlineStyles = const [],
  }) {
    // Verify inlineStyles.
    for (var i = 0; i < inlineStyles.length - 1; ++i) {
      // Is not overlapping next style.
      if (inlineStyles[i].isOverlappingWith(inlineStyles[i + 1])) {
        throw const FormatException('Invalid BlockCollection inlineStyle: '
            'styles must not have overlapping bounds.');
      }

      // Style's responsible regions are in non-descending order.
      if (inlineStyles[i] > inlineStyles[i + 1]) {
        throw const FormatException('Invalid BlockCollection inlineStyles: '
            'must be defined in ascending index order.');
      }
    }

    // Verify last inline style is within text's bounds.
    // Unnecessary to test for < 0 index since this is already
    // tested in the style node.
    if (inlineStyles.isNotEmpty && inlineStyles.last.endIndex > text.length) {
      throw const FormatException('Invalid BlockCollection inlineStyles: '
          'must not define style out of text bounds.');
    }
  }

  /// Copy builder.
  ///
  /// Creates a copy of the current Block and updates the fields to
  /// [id], [text], [blockStyle], and [inlineStyles] when provided.
  @override
  BlockCollection copyWith({
    List<Id>? childIds,
    int? parent,
    bool? hasThreadAsParent,
    String? text,
    BlockStyle? blockStyle,
    List<StyleNode>? inlineStyles,
  }) =>
      BlockCollection(
        id: super.id,
        childIds: childIds ?? super.childIds,
        parent: parent ?? this.parent,
        hasThreadAsParent: hasThreadAsParent ?? this.hasThreadAsParent,
        text: text ?? this.text,
        blockStyle: blockStyle ?? this.blockStyle,
        inlineStyles: inlineStyles ?? this.inlineStyles,
      );

  @override
  String toString() => 'Block $id: "$text"';
}
