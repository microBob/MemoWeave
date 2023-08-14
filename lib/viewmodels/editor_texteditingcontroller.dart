import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/editor_viewmodel.dart';

class EditorTextEditingController extends TextEditingController {
  final EditorViewModelProvider editorViewModelProvider;
  final WidgetRef widgetRef;

  EditorTextEditingController(
      {required this.editorViewModelProvider, required this.widgetRef}) {
    widgetRef.watch(editorViewModelProvider.notifier).test();
  }
}
