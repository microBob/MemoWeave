import 'dart:io';

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
  /// Get props and initialize the Block.
  @override
  FutureOr<BlockCollection> build(BlockProps props) async {
    final state = await _getState();

    props.textEditingController.rootBlock = state;
    props.textEditingController.text = state.text;

    props.textEditingController.addListener(handleInput);

    return state;
  }

  Future<BlockCollection> _getState() async {
    final databaseManager = await ref.read(databaseManagerProvider.future);
    final blockCollection =
        await databaseManager.getBlockCollectionById(props.blockId);
    if (blockCollection == null) {
      throw FileSystemException(
          'Block with ID ${props.blockId} does not exist!');
    }

    await blockCollection.children.load();
    await blockCollection.parents.load();

    return blockCollection;
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  void handleInput() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        final currentState = await _getState();

        // Create updated rootBlock.
        final newRootBlock =
            currentState.copyWith(text: props.textEditingController.text);

        props.textEditingController.rootBlock = newRootBlock;

        // Write into database.
        final databaseManager = await ref.read(databaseManagerProvider.future);
        databaseManager.putBlockCollection(newRootBlock);

        return _getState();
      },
    );
  }
}
