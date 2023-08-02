import 'package:flutter/material.dart';
import 'package:memoweave/widgets/block_widget.dart';

/// Text editor interface
///
/// Combines [BlockWidget]s together and handles input
class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Stack(
          children: [
            SelectableText.rich(
              TextSpan(
                children: [
                  BlockWidget(id: 'first'),
                  BlockWidget(id: 'second'),
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
