import 'package:flutter/material.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_viewmodel.g.dart';

/// Block logic.
///
/// ViewModel for [BlockWidget].
@riverpod
class BlockViewModel extends _$BlockViewModel {
  /// Props from the widget.
  late BlockProps _props;

  /// Get props and initialize the Block.
  @override
  BlockCollection build(BlockProps props) {
    // Populate fields.
    _props = props;
    final blockId = props.blockId;

    // Set change handler on TextEditingController.
    _props.textEditingController.addListener(handleInput);

    // Create a default state to use.
    final defaultState = BlockCollection();

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

            // Load text into text field.
            _props.textEditingController.rootBlock = blockCollection;

            // Update text field text after provider is built.
            Future(() {
              _props.textEditingController.text = blockCollection.text;
            });

            // Create state with block.
            return blockCollection;
          },
          // Return the default state when one from the database is unavailable.
          error: (_, __) => defaultState,
          loading: () => defaultState,
        );
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() async {
    // Create updated rootBlock.
    final newRootBlock =
        state.copyWith(text: _props.textEditingController.text);

    // Update rootBlock on Text Editing Controller.
    _props.textEditingController.rootBlock = newRootBlock;

    // Write into database.
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putBlockCollection(newRootBlock);

    // Update state.
    state = newRootBlock;
  }
}
