import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_callback_props.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/block_collection_tree_node.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

part 'block_props.freezed.dart';

/// Properties to be passed to [BlockViewModel].
@freezed
class BlockProps with _$BlockProps {
  const factory BlockProps({
    required BlockCollectionTreeNode blockCollectionTreeNode,
    required Id idOfBlockInFocus,
    required KeyEventResult Function(
      KeyEvent,
      BlockCallbackProps,
    ) onKeyEventCallback,
    required Function(
      bool,
      BlockCallbackProps,
    ) onFocusChangedCallback,
    required Function(
      BlockCollection,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
  }) = _BlockProps;
}
