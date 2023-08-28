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
  BlockCollection build({
    required BlockProps props,
    required BlockTextEditingController blockTextEditingController,
  }) {
    blockTextEditingController.rootBlock = props.blockCollection;
    blockTextEditingController.text = props.blockCollection.text;

    blockTextEditingController.addListener(handleInput);

    return props.blockCollection;
  }

  /// Handle new input.
  ///
  /// Update [state]'s rootBlock with text/style and set cursor position.
  /// Throws [FormatException] if unable to find render editable.
  Future<void> handleInput() async {
    // Create updated rootBlock.
    final newRootBlock = state.copyWith(text: blockTextEditingController.text);

    blockTextEditingController.rootBlock = newRootBlock;

    // Write into database.
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putBlockCollection(newRootBlock);

    state = newRootBlock;
  }
}
