import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../viewmodels/block_texteditingcontroller.dart';
import 'block_callback_props.dart';
import 'block_collection.dart';
import 'block_collection_tree_node.dart';

part 'block_props.freezed.dart';

/// Properties to be passed into a Block ViewModel.
@freezed
class BlockProps with _$BlockProps {
  /// Properties to be passed into a Block ViewModel.
  ///
  /// Provides the [blockCollectionTreeNode] of the Block,
  /// passes the [onBlockTextEditingControllerChangedCallback] to be
  /// attached to the [BlockTextEditingController]'s change notifier,
  /// passes the [onKeyEventCallback] to be attached to the Block's
  /// [FocusNode]'s onKey event,
  /// and passes the [initBlockFocusAndCaret] to be attached to the Block's
  /// widget build completion.
  const factory BlockProps({
    required BlockCollectionTreeNode blockCollectionTreeNode,
    required Function(
      BlockCollection,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
    required KeyEventResult Function(
      FocusNode,
      KeyEvent,
      BlockCallbackProps,
    ) onKeyEventCallback,
    required void Function(
      FocusNode,
      BlockCallbackProps,
    ) initBlockFocusAndCaret,
  }) = _BlockProps;
}
