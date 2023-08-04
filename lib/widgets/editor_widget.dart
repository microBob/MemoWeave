import 'package:flutter/material.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
