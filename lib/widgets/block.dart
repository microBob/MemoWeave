import 'package:flutter/material.dart';

/// A single line or "block" of text
///
/// Encapsulates the text rendering, input handling, and cursor drawing
class Block extends StatelessWidget {
  const Block({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Text.rich(
                TextSpan(
                  text: 'First ',
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Second ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Third'),
                  ],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
