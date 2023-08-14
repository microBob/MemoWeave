import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/editor_props.dart';
import 'package:memoweave/viewmodels/editor_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

/// Text editor interface
///
/// Renders text, handles input, and drawing the cursor
class EditorWidget extends ConsumerWidget {
  EditorWidget({super.key});

  // Props to pass to the viewmodel
  final EditorProps _props = (
    textFieldKey: GlobalKey(),
    textFieldFocusNode: FocusNode(),
    blockId: 61254764,
  );

  /// Attach to [EditorViewModel] and build UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define provider with text key and focus node
    final provider = editorViewModelProvider(_props);

    // Find TextField's RenderEditable
    Future(() => ref.watch(provider.notifier).findRenderEditable());

    // Split behavior based on data state
    return Stack(
      children: [
        TextField(
          key: _props.textFieldKey,
          focusNode: _props.textFieldFocusNode,
          controller: EditorTextEditingController(
              editorViewModelProvider: provider, widgetRef: ref),
        ),
        AnimatedContainer(
          width: 2,
          height: 18,
          alignment: Alignment.topLeft,
          margin: ref.watch(provider).cursorInsets,
          duration: const Duration(milliseconds: 100),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        Text.rich(ref.watch(provider.notifier).rootToTextSpan()),
      ],
    );
  }
}
