import 'package:flutter/material.dart';
import 'package:memoweave/models/block_model.dart';

class EditorState {
  EdgeInsets cursorInsets = EdgeInsets.zero;
  BlockModel rootBlock = BlockModel.empty();

  EditorState();

  EditorState.rootBlock({required this.rootBlock});

  EditorState.copy({required this.cursorInsets, required this.rootBlock});
}
