import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';

/// [EditorWidget] state.
class EditorState {
  /// [Rect] used to define the caret's location and dimensions.
  final Rect caretRect;

  /// Root text information for this editor.
  final BlockCollection rootBlock;

  /// Default constructor.
  ///
  /// Defines [caretRect] and [rootBlock].
  /// Will supply default values if none are given for [caretRect].
  EditorState({
    this.caretRect = Rect.zero,
    required this.rootBlock,
  });

  /// Copy builder.
  ///
  /// Creates a copy of the current state and updates fields with
  /// [caretRect] and [rootBlock] when provided.
  EditorState copyWith({
    Rect? caretRect,
    BlockCollection? rootBlock,
  }) {
    return EditorState(
      caretRect: caretRect ?? this.caretRect,
      rootBlock: rootBlock ?? this.rootBlock,
    );
  }
}
