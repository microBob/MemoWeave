import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

class EditorState {
  /// Margin from the left and top to offset the cursor in the editor.
  EdgeInsets cursorInsets = EdgeInsets.zero;

  /// Root text data to display.
  BlockCollection rootBlock = BlockCollection();

  /// Default constructor.
  EditorState();

  /// Constructor with cursor in top left and with supplied block.
  EditorState.rootBlock({required this.rootBlock});

  /// Create a new instance with editing both cursor and text block.
  EditorState.copy({required this.cursorInsets, required this.rootBlock});
}
