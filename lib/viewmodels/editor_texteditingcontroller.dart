import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/editor_state.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

class EditorTextEditingController extends TextEditingController {
  final EditorViewModelProvider editorViewModelProvider;
  final AutoDisposeNotifierProviderRef<EditorState> widgetRef;

  EditorTextEditingController(
      {required this.editorViewModelProvider, required this.widgetRef});

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    var styles = widgetRef.watch(editorViewModelProvider).rootBlock.styles;
    for (var style in styles) {
      print(style.styles);
    }
    return TextSpan(style: DefaultTextStyle.of(context).style, children: [
      TextSpan(text: 'Hello'),
      TextSpan(
          text: ' Emphasis text in red ',
          style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'post test.'),
    ]);
  }
}
