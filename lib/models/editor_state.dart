import 'package:flutter/material.dart';
import 'package:memoweave/models/block_model.dart';

class EditorState {
  final GlobalKey textKey;
  EdgeInsets cursorInsets = EdgeInsets.zero;
  BlockModel rootBlock = BlockModel.empty();

  EditorState({required this.textKey});

  EditorState.rootBlock({required this.textKey, required this.rootBlock});
}
