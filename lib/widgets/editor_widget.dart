import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  EditorWidget({super.key});

  final GlobalKey textKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      onPointerDown:
          ref.read(editorViewModelProvider(textKey).notifier).handleTap,
      child: Stack(
        children: [
          SelectionArea(
            child: Text.rich(
              key: textKey,
              ref
                  .watch(editorViewModelProvider(textKey).notifier)
                  .rootToTextSpan(),
            ),
          ),
          AnimatedContainer(
            width: 2,
            height: 18,
            alignment: Alignment.topLeft,
            margin: ref.watch(editorViewModelProvider(textKey)).cursorInsets,
            duration: const Duration(milliseconds: 100),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
