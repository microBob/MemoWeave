import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          SelectableText.rich(
            EditorViewModel().rootToTextSpan(),
          ),
          AnimatedContainer(
            width: 2,
            height: 18,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 18, top: 1),
            duration: const Duration(milliseconds: 100),
            color: Theme.of(context).colorScheme.onSurface,
          )
        ],
      ),
      onTapDown: (details) {
        print('Hello');
        if (kDebugMode) {
          print('World');
        }
        EditorViewModel().handleTap(
            details, _getRenderParagraph(context.findRenderObject()));
      },
    );
  }

  /// Get the [RenderParagraph] in the [SelectableText.rich]
  ///
  /// [renderObject] must be from the top level [GestureDetector]
  /// Should never return `null`
  RenderParagraph _getRenderParagraph(RenderObject? renderObject) {
    // If the object is the RenderParagraph we have found it and can exit
    if (renderObject is RenderParagraph) {
      return renderObject;
    } else if (renderObject == null) {
      // Should never reach this state
      throw Exception("Couldn't find RenderObject. It doesn't exist.");
    }

    // Recurse through children
    renderObject.visitChildren((child) {
      _getRenderParagraph(child);
    });

    // Should never reach this state
    throw Exception("Couldn't find RenderParagraph. Search depth too deep.");
  }
}
