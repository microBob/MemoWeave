import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

class EditorState {
  EdgeInsets cursorInsets = EdgeInsets.zero;
  BlockCollection rootBlock = BlockCollection();

  EditorState();

  EditorState.rootBlock({required this.rootBlock});

  EditorState.copy({required this.cursorInsets, required this.rootBlock});
}
