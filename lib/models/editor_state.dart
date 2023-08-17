import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/viewmodels/editor_texteditingcontroller.dart';

/// Editor widget state.
class EditorState {
  /// [EdgeInsets] used to define the cursor's location.
  final EdgeInsets cursorInsets;

  /// [TextEditingController] responsible for handling
  /// input on the editor [TextField].
  ///
  /// Requirement: [textEditingController.rootBlock] == [rootBlock]
  final EditorTextEditingController textEditingController;

  /// Root text information for this editor.
  final BlockCollection rootBlock;

  /// Default constructor
  ///
  /// Defines [cursorInset], [textEditingController], and  [rootBlock].
  /// Will supply default values if none are given for [cursorInsets].
  /// [textEditingController] is automatically defined from [rootBlock].
  EditorState({
    this.cursorInsets = EdgeInsets.zero,
    required this.rootBlock,
  }) : textEditingController =
            EditorTextEditingController(rootBlock: rootBlock);

  /// Copy builder.
  ///
  /// Creates a copy of the current state and updates fields with
  /// [cursorInsets] and [rootBlock] when provided.
  EditorState copyWith({
    EdgeInsets? cursorInsets,
    BlockCollection? rootBlock,
  }) {
    return EditorState(
      cursorInsets: cursorInsets ?? this.cursorInsets,
      rootBlock: rootBlock ?? this.rootBlock,
    );
  }
}
