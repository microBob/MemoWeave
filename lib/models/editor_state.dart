import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/viewmodels/editor_texteditingcontroller.dart';

/// Editor widget state.
class EditorState {
  /// [EdgeInsets] used to define the cursor's location.
  final EdgeInsets cursorInsets;

  /// [TextEditingController] responsible for handling
  /// input on the editor [TextField].
  final TextEditingController textEditingController;

  /// Root text information for this editor.
  final BlockCollection rootBlock;

  /// Default constructor
  ///
  /// Defines [cursorInset], [textEditingController], and  [rootBlock].
  /// Will supply default values if none are given.
  EditorState({
    this.cursorInsets = EdgeInsets.zero,
    TextEditingController? textEditingController,
    required this.rootBlock,
  }) : textEditingController = textEditingController ??
            EditorTextEditingController(rootBlock: rootBlock);

  /// Copy builder.
  ///
  /// Creates a copy of the current state and updates
  /// [cursorInsets] to [newCursorInsets],
  /// [textEditingController] to [newTextEditingController],
  /// and [rootBlock] to [newRootBlock] when provided.
  EditorState copyWith({
    EdgeInsets? newCursorInsets,
    TextEditingController? newTextEditingController,
    BlockCollection? newRootBlock,
  }) {
    return EditorState(
      cursorInsets: newCursorInsets ?? cursorInsets,
      textEditingController: newTextEditingController ?? textEditingController,
      rootBlock: newRootBlock ?? rootBlock,
    );
  }
}
