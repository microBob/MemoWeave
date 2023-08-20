import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

/// Editor widget state.
class EditorState {
  /// [EdgeInsets] used to define the cursor's location.
  final EdgeInsets cursorInsets;

  /// Root text information for this editor.
  final BlockCollection rootBlock;

  /// Default constructor
  ///
  /// Defines [cursorInsets], [textEditingController], and  [rootBlock].
  /// Will supply default values if none are given for [cursorInsets]
  /// and [textEditingController].
  EditorState({
    this.cursorInsets = EdgeInsets.zero,
    required this.rootBlock,
  });

  /// Copy builder.
  ///
  /// Creates a copy of the current state and updates fields with
  /// [cursorInsets], [textEditingController], and [rootBlock] when provided.
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
