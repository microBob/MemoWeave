import 'package:flutter/material.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Combines [BlockWidget]s together and handles input
class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              SelectableText.rich(EditorViewModel().rootToTextSpan()),
            ],
          ),
        ),
      ],
    );
  }
}
