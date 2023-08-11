import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  EditorWidget({super.key});

  /// Key used to access the [RenderParagraph]
  final GlobalKey _textKey = GlobalKey();

  /// [FocusNode] used to control and handle input
  final FocusNode _inputFocusNode = FocusNode();

  /// Attach to [EditorViewModel] and build UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define provider with text key and focus node
    final EditorViewModelProvider provider =
        editorViewModelProvider(_textKey, _inputFocusNode);

    // Update against provider
    final editorViewModelWatch = ref.watch(provider);

    // Split behavior based on data state
    return editorViewModelWatch.when(
      data: (editorState) => Listener(
        onPointerDown: ref.read(provider.notifier).handleTap,
        child: Stack(
          children: [
            Visibility(
              visible: false,
              maintainState: true,
              child: TextField(
                focusNode: _inputFocusNode,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            SelectionArea(
              child: Text.rich(
                key: _textKey,
                ref.read(provider.notifier).rootToTextSpan(),
              ),
            ),
            AnimatedContainer(
              width: 2,
              height: 18,
              alignment: Alignment.topLeft,
              margin: editorState.cursorInsets,
              duration: const Duration(milliseconds: 100),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
      error: (error, stack) => Text('ERROR: $error'),
      loading: () => const LinearProgressIndicator(),
    );
  }
}
