import 'package:flutter/material.dart';
import 'package:memoweave/models/block_model.dart';

class EditorState {
  final GlobalKey textKey;
  final FocusNode inputFocusNode;
  EdgeInsets cursorInsets = EdgeInsets.zero;
  BlockModel rootBlock = BlockModel.empty();

  EditorState({required this.textKey, required this.inputFocusNode});

  EditorState.rootBlock(
      {required this.textKey,
      required this.inputFocusNode,
      required this.rootBlock});

  EditorState.copy(
      {required this.textKey,
      required this.inputFocusNode,
      required this.cursorInsets,
      required this.rootBlock});
}
