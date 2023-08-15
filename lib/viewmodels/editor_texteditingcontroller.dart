import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

class EditorTextEditingController extends TextEditingController {
  final EditorViewModelProvider editorViewModelProvider;
  final WidgetRef widgetRef;

  EditorTextEditingController(
      {required this.editorViewModelProvider, required this.widgetRef});

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    var styles = widgetRef.read(editorViewModelProvider).rootBlock.styles;
    for (var style in styles) {
      print(style.format);
    }
    return TextSpan(
        text: text,
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.red));
  }
}
