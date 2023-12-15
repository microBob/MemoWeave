import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection_tree_node.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

part 'block_props.freezed.dart';

/// Properties to be passed to [BlockViewModel].
@freezed
class BlockProps with _$BlockProps {
  const factory BlockProps({
    required BlockCollectionTreeNode blockCollectionTreeNode,
    required Id idOfBlockInFocus,
    required KeyEventResult Function(FocusNode, KeyEvent, RenderEditable)
        onEditorTraversalCallback,
    required Function(bool, Id) onFocusChangedCallback,
    required Function(BlockTextEditingController, Id)
        onBlockTextEditingControllerChangedCallback,
  }) = _BlockProps;
}
