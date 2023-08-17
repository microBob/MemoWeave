import 'package:isar/isar.dart';
import 'package:memoweave/models/style_node.dart';

part 'block_collection.g.dart';

/// Styles that affect the whole block.
enum BlockStyle {
  none,
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
  final String text;

  /// Block base style.
  ///
  /// Applies to the whole block in addition to any [InlineStyle]s.
  @enumerated
  final BlockStyle blockStyle;

  /// Inline styles to apply onto the text.
  ///
  /// Requirement: nodes do not overlap their responsible regions,
  /// nodes are stored in ascending index order,
  /// and the styles are within the text length.
  final List<StyleNode> inlineStyles;

  /// Ordered set of hierarchical children to this block.
  final children = IsarLinks<BlockCollection>();

  /// Links back to parents.
  @Backlink(to: 'children')
  final parents = IsarLinks<BlockCollection>();

  /// Default constructor.
  ///
  /// Defines [text], [blockStyle], and [inlineStyles].
  /// Will also supply default values if none are given.
  BlockCollection({
    this.text = 'Blank state text',
    this.blockStyle = BlockStyle.none,
    this.inlineStyles = const [],
  }) {
    // Verify inlineStyles has no overlaps and is in ascending order
    for (var i = 0; i < inlineStyles.length - 1; ++i) {
      if (inlineStyles[i].isOverlappingWith(inlineStyles[i + 1])) {
        throw const FormatException('Invalid BlockCollection inlineStyle: '
            'styles must not have overlapping bounds.');
      }
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
  /// Creates a copy of the current block and updates
  /// [text] to [newText], [blockStyle] to [newBlockStyle],
  /// and [inlineStyles] to [newInlineStyles] when provided.
  BlockCollection copyWith({
    String? newText,
    BlockStyle? newBlockStyle,
    List<StyleNode>? newInlineStyles,
  }) {
    return BlockCollection(
      text: newText ?? text,
      blockStyle: newBlockStyle ?? blockStyle,
      inlineStyles: newInlineStyles ?? inlineStyles,
    );
  }
}
