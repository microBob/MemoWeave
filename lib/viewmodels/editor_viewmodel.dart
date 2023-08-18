import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/editor_props.dart';
import 'package:memoweave/models/editor_state.dart';
import 'package:memoweave/utils/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editor_viewmodel.g.dart';

/// Text editor logic.
///
/// Utilized by [EditorWidget].
@riverpod
class EditorViewModel extends _$EditorViewModel {
  /// Props from the widget.
  late final EditorProps _props;

  /// Reference to the [TextField]'s [RenderEditable].
  RenderEditable? _renderEditable;

  /// Get props and initialize a default editor.
  @override
  EditorState build(EditorProps props) {
    // Populate fields.
    _props = props;
    final blockId = props.blockId;

    // Create a default state to use.
    final defaultState = EditorState(rootBlock: BlockCollection());

    // Generate default state if not loading previous.
    if (blockId == null) {
      return defaultState;
    }

    // Load block from database.
    return ref.watch(blockCollectionByIdProvider(id: blockId)).when(
          data: (blockCollection) {
            // Return default state if no block are found.
            if (blockCollection == null) {
              return defaultState;
            }

            // Create state with block.
            return EditorState(rootBlock: blockCollection);
          },
          // Return the default state when one from the database is unavailable.
          error: (_, __) => defaultState,
          loading: () => defaultState,
        );
  }

  /// Handle new input
  ///
  /// Contents of the [TextField] is accessed via [newText]
  void handleTextChange(String newText) {
    print(newText);
  }

  /// Search through widget tree to find [RenderEditable]
  ///
  /// Sets [_renderEditable] to the found [RenderEditable]
  Future<void> findRenderEditable([Element? root]) async {
    // Shortcut exit if it has already been found
    if (_renderEditable != null) {
      return;
    }

    // Starter case: No element given, then we start from the TextField's children
    if (root == null) {
      _props.textFieldKey.currentContext?.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
      return;
    }

    // Regular case: Check the current object, then traverse children
    var renderObject = root.renderObject;
    if (renderObject is RenderEditable) {
      _renderEditable = renderObject;
      _renderEditable?.onCaretChanged = (r) => print(r);
    } else {
      root.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
    }
  }
}
