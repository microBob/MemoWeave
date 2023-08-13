import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/editor_props.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  EditorWidget({super.key});

  // Props to pass to the viewmodel
  final EditorProps _props = (
    textKey: GlobalKey(),
    keyboardFocusNode: FocusNode(),
    textEditingController: TextEditingController(),
    blockId: null,
  );

  /// Attach to [EditorViewModel] and build UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define provider with text key and focus node
    final provider = editorViewModelProvider(_props);

    // Update against provider
    final editorViewModelWatch = ref.watch(provider);

    // Split behavior based on data state
    return editorViewModelWatch.when(
      data: (editorState) => Listener(
        onPointerDown: ref.read(provider.notifier).handleTap,
        child: SelectionArea(
          onSelectionChanged: (newSelection) => print(newSelection?.plainText),
          child: Stack(
            children: [
              Text.rich(
                key: _props.textKey,
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
                    ignoring: ref.read(provider.notifier).isOnMobilePlatform(),
                child: EditableText(
                  controller: _props.textEditingController,
                  focusNode: _props.keyboardFocusNode,
                  style: const TextStyle(color: Colors.transparent),
                  cursorColor: Colors.transparent,
                  backgroundCursorColor: Colors.transparent,
                  showCursor: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 3,
                  onChanged: (newText) =>
                      print('${_props.keyboardFocusNode}: $newText'),
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
