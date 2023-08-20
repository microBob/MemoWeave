import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

/// [EditorWidget] state.
class EditorState {
  /// [EdgeInsets] used to define the cursor's location.
  final EdgeInsets cursorInsets;

  /// Root text information for this editor.
  final BlockCollection rootBlock;

  /// Default constructor.
  ///
  /// Defines [cursorInsets] and [rootBlock].
  /// Will supply default values if none are given for [cursorInsets].
  EditorState({
    this.cursorInsets = EdgeInsets.zero,
    required this.rootBlock,
  });

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
