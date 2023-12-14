import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/style_node.dart';

/// [TextEditingController] managing a Block's [TextField].
///
/// Responsible for applying styling to the text.
class BlockTextEditingController extends TextEditingController {
  final BlockCollection _blockCollection;

  /// Generative constructor.
  BlockTextEditingController({required BlockCollection blockCollection})
      : _blockCollection = blockCollection;

  /// Apply styling to [TextField]'s text.
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    // Prepare build output and pointer.
    final children = <TextSpan>[];
    var currentIndex = 0;

    // Assess each inlineStyle and build TextSpans.
    for (var inlineStyle in _blockCollection.inlineStyles) {
      // Build plain text before inlineStyle.
      if (currentIndex < inlineStyle.startIndex) {
        children.add(
          TextSpan(
            text: text.substring(currentIndex, inlineStyle.startIndex),
          ),
        );

        // Update current index.
        currentIndex = inlineStyle.startIndex;
      }

      // Build style.
      final textStyle = TextStyle(
        fontStyle: inlineStyle.styles.contains(InlineStyle.italic)
            ? FontStyle.italic
            : null,
        fontWeight: inlineStyle.styles.contains(InlineStyle.bold)
            ? FontWeight.bold
            : null,
      );

      // Add text span.
      children.add(
        TextSpan(
          text: text.substring(currentIndex, inlineStyle.endIndex),
          style: textStyle,
        ),
      );

      // Update index
      currentIndex = inlineStyle.endIndex;
    }

    // Fill in remaining characters at the end as plain text.
    children.add(
      TextSpan(
        text: text.substring(currentIndex, text.length),
      ),
    );

    // Return built span.
    return TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: children,
    );
  }
}
