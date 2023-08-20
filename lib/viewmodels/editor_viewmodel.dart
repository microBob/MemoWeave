import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/editor_props.dart';
import 'package:memoweave/models/editor_state.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/editor_texteditingcontroller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editor_viewmodel.g.dart';

/// Text editor logic.
///
/// ViewModel for [EditorWidget].
@riverpod
class EditorViewModel extends _$EditorViewModel {
  /// Props from the widget.
  late EditorProps _props;

  /// Reference to the [TextField]'s [RenderEditable].
  RenderEditable? _renderEditable;

  /// Get props and initialize a default editor.
  @override
  EditorState build(EditorProps props) {
    // Populate fields.
    _props = props;
    final blockId = props.blockId;

    // Set change handler on TextEditingController.
    _props.textEditingController.addListener(handleInput);

    // Create a default state to use.
    final defaultState = EditorState(rootBlock: BlockCollection());

    // Use default state if not loading previous.
    if (blockId == null) {
      return defaultState;
    }

    // Load block from database.
    return ref.watch(getBlockCollectionByIdProvider(id: blockId)).when(
          data: (blockCollection) {
            // Return default state if no block are found.
            if (blockCollection == null) {
              return defaultState;
            }

            // Load text into text field
            _props.textEditingController.rootBlock = blockCollection;

            // Update text field text after provider is built.
            Future(() {
              _props.textEditingController.value = _props
                  .textEditingController.value
                  .copyWith(text: blockCollection.text);
            });

            // Create state with block.
            return EditorState(rootBlock: blockCollection);
          },
          // Return the default state when one from the database is unavailable.
          error: (_, __) => defaultState,
          loading: () => defaultState,
        );
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  void handleInput() async {
    // Create updated rootBlock.
    final newRootBlock =
        state.rootBlock.copyWith(text: _props.textEditingController.text);

    // Update rootBlock on Text Editing Controller.
    _props.textEditingController.rootBlock = newRootBlock;

    // Write into database.
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putBlockCollection(newRootBlock);

    // Update state.
    state = state.copyWith(rootBlock: newRootBlock);
  }

  /// Search through widget tree to find [RenderEditable].
  ///
  /// Sets [_renderEditable] to the found [RenderEditable].
  Future<void> findRenderEditable([Element? root]) async {
    // Shortcut exit if it has already been found.
    if (_renderEditable != null) {
      return;
    }

    // Starter case: No element given,
    // then we start from the TextField's children.
    if (root == null) {
      _props.textFieldKey.currentContext?.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
      return;
    }

    // Regular case: Check the current object, then traverse children.
    var renderObject = root.renderObject;
    if (renderObject is RenderEditable) {
      _renderEditable = renderObject;
    } else {
      root.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
    }
  }
}
