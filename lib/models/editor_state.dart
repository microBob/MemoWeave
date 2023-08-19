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
  /// Defines [cursorInsets], [textEditingController], and  [rootBlock].
  /// Will supply default values if none are given for [cursorInsets]
  /// and [textEditingController].
  EditorState({
    this.cursorInsets = EdgeInsets.zero,
    EditorTextEditingController? textEditingController,
    required this.rootBlock,
  }) : textEditingController = textEditingController ??
            EditorTextEditingController(rootBlock: rootBlock) {
    // Validate rootBlock was passed to [textEditingController]
    if (this.textEditingController.rootBlock != rootBlock) {
      throw const FormatException('Invalid EditorState textEditingController: '
          'must have same root block as state.');
    }
  }

  /// Copy builder.
  ///
  /// Creates a copy of the current state and updates fields with
  /// [cursorInsets], [textEditingController], and [rootBlock] when provided.
  EditorState copyWith({
    EdgeInsets? cursorInsets,
    EditorTextEditingController? textEditingController,
    BlockCollection? rootBlock,
  }) {
    return EditorState(
      cursorInsets: cursorInsets ?? this.cursorInsets,
      textEditingController:
          textEditingController ?? this.textEditingController,
      rootBlock: rootBlock ?? this.rootBlock,
    );
  }
}
