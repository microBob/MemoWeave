import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  EditorWidget({super.key});

  // Text key for code access
  final GlobalKey _textKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EditorViewModelProvider provider = editorViewModelProvider(_textKey);

    return Listener(
      onPointerDown: ref.read(provider.notifier).handleTap,
      child: Stack(
        children: [
          Visibility(
            visible: false,
            maintainState: true,
            child: TextField(
              focusNode: ref.read(provider).inputFocusNode,
            ),
          ),
          SelectionArea(
            child: Text.rich(
              key: _textKey,
              ref.watch(provider.notifier).rootToTextSpan(),
            ),
          ),
          AnimatedContainer(
            width: 2,
            height: 18,
            alignment: Alignment.topLeft,
            margin: ref.watch(provider).cursorInsets,
            duration: const Duration(milliseconds: 100),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
