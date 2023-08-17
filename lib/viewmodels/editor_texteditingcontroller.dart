import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/style_node.dart';

/// [TextEditingController] managing an editor [TextField].
///
/// Responsible for applying styling to the text.
class EditorTextEditingController extends TextEditingController {
  /// Root block that the governed [TextField] is representing.
  final BlockCollection rootBlock;

  /// Default constructor.
  ///
  /// Defines [rootBlock] and updates the [text].
  EditorTextEditingController({required this.rootBlock}) {
    value = value.copyWith(text: rootBlock.text);
  }

  /// Apply styling to [TextField]'s text.
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    // Get styles and prepare to build
    final children = <TextSpan>[];
    var currentIndex = 0;

    // Assess each inlineStyle and build TextSpans
    for (var inlineStyle in rootBlock.inlineStyles) {
      // Build plain text before inlineStyle
      if (currentIndex < inlineStyle.startIndex) {
        children.add(
          TextSpan(
            text:
                rootBlock.text.substring(currentIndex, inlineStyle.startIndex),
          ),
        );

        // Update current index
        currentIndex = inlineStyle.startIndex;
      }

      // Build individual style
      final textStyle = TextStyle(
        fontStyle: inlineStyle.styles.contains(InlineStyle.italic)
            ? FontStyle.italic
            : null,
        fontWeight: inlineStyle.styles.contains(InlineStyle.bold)
            ? FontWeight.bold
            : null,
      );

      // Add text span
      children.add(
        TextSpan(
          text: rootBlock.text.substring(currentIndex, inlineStyle.endIndex),
          style: textStyle,
        ),
      );

      // Update index
      currentIndex = inlineStyle.endIndex;
    }

    // Fill in remaining characters as plain text
    children.add(
      TextSpan(
        text: text.substring(currentIndex, text.length),
      ),
    );

    // Return built span
    return TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: children,
    );
  }
}
