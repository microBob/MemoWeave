import 'package:flutter/material.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              SelectableText.rich(
                EditorViewModel().rootToTextSpan(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
