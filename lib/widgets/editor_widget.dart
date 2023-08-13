import 'package:flutter/foundation.dart';
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
  final FocusNode _keyboardFocusNode = FocusNode();

  /// [TextEditingController] for handling input
  final TextEditingController textEditingController = TextEditingController();

  /// Attach to [EditorViewModel] and build UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define provider with text key and focus node
    final provider = editorViewModelProvider(
        _textKey, _keyboardFocusNode, textEditingController);

    // Update against provider
    final editorViewModelWatch = ref.watch(provider);

    // Split behavior based on data state
    return editorViewModelWatch.when(
      data: (editorState) => Listener(
        onPointerDown: ref.read(provider.notifier).handleTap,
        child: SelectionArea(
          child: Stack(
            children: [
              Text.rich(
                key: _textKey,
                ref.read(provider.notifier).rootToTextSpan(),
              ),
              AnimatedContainer(
                width: 2,
                height: 18,
                alignment: Alignment.topLeft,
                margin: editorState.cursorInsets,
                duration: const Duration(milliseconds: 100),
                color: Theme.of(context).colorScheme.onSurface,
              ),
              IgnorePointer(
                ignoring: defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android,
                child: EditableText(
                  controller: TextEditingController(),
                  focusNode: _keyboardFocusNode,
                  style: const TextStyle(color: Colors.transparent),
                  cursorColor: Colors.transparent,
                  backgroundCursorColor: Colors.transparent,
                  showCursor: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 3,
                  onChanged: (newText) =>
                      print('${_keyboardFocusNode}: $newText'),
                  enableInteractiveSelection: false,
                ),
              ),
            ],
          ),
        ),
      ),
      error: (error, stack) => Text('ERROR: $error'),
      loading: () => const LinearProgressIndicator(),
    );
  }
}
