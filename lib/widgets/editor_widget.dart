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
    textEditingController: EditorTextEditingController(),
    blockId: 3,
  );

  /// Attach to [EditorViewModel] and build UI
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define provider with text key and focus node
    final provider = editorViewModelProvider(_props);

    final caretRect = ref.watch(provider).caretRect;

    // Split behavior based on data state
    return Stack(
      children: [
        TextField(
          key: _props.textFieldKey,
          focusNode: _props.textFieldFocusNode,
          controller: _props.textEditingController,
          maxLines: null,
        ),
        AnimatedContainer(
          width: caretRect.width,
          height: caretRect.height,
          margin: EdgeInsets.only(left: caretRect.left, top: caretRect.top),
          alignment: Alignment.topLeft,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
