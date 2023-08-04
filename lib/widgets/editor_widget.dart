import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
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
          ),
        ],
      ),
      onPointerDown: (pointerDownEvent) => EditorViewModel()
          .handleTap(pointerDownEvent, _getRenderParagraph(context)),
    );
  }

  /// Get the [RenderParagraph] in the [SelectableText.rich].
  ///
  /// [renderObject] must be from the top level [Listener].
  /// Should never fail.
  RenderParagraph _getRenderParagraph(BuildContext listenerBuildContext) {
    // Check if we started in the Listener.
    if (listenerBuildContext.findRenderObject() is! RenderPointerListener) {
      throw Exception('Invalid input: Expected to start in Listener');
    }

    // Hierarchy should be Stack -> SelectableText.
    RenderParagraph? renderParagraph;
    listenerBuildContext.visitChildElements(
      (stackElement) {
        // Continue when at Stack
        if (stackElement.findRenderObject() is RenderStack) {
          // Check Stack for SelectableText.
          stackElement.visitChildren(
            (element) {
              if (element.findRenderObject() is RenderParagraph) {
                renderParagraph = element.findRenderObject() as RenderParagraph;

                // Exit once found.
                return;
              }
            },
          );
        }
      },
    );

    if (renderParagraph != null) {
      return renderParagraph!;
    }
    throw Exception("Invalid state: Couldn't find RenderParagraph.");
  }
}
