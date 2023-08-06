import 'package:flutter/material.dart';
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
      onPointerDown: ref.read(editorViewModelProvider.notifier).handleTap,
      child: Stack(
        children: [
          SelectableText.rich(
            key: ref.read(editorViewModelProvider.notifier).textKey,
            ref.watch(editorViewModelProvider.notifier).rootToTextSpan(),
          ),
          AnimatedContainer(
            width: 2,
            height: 18,
            alignment: Alignment.topLeft,
            margin: ref.watch(editorViewModelProvider.notifier).cursorInsets,
            duration: const Duration(milliseconds: 100),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
