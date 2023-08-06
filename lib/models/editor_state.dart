import 'package:flutter/material.dart';
import 'package:memoweave/models/block_model.dart';

class EditorState {
  final GlobalKey textKey = GlobalKey();
  EdgeInsets cursorInsets = EdgeInsets.zero;
  BlockModel rootBlock = BlockModel.empty();

  EditorState();

  EditorState.rootBlock(this.rootBlock);
}
