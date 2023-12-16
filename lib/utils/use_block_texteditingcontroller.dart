import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/views/block_view.dart';

/// Hook function for [BlockTextEditingController].
BlockTextEditingController useBlockTextEditingController({
  required BlockCollection blockCollection,
  required Function(
    Id,
    BlockTextEditingController,
  ) onBlockTextEditingControllerChangedCallback,
  required GlobalKey blockKey,
}) {
  return use(_BlockTextEditingController(
    blockCollection: blockCollection,
    onBlockTextEditingControllerChangedCallback:
        onBlockTextEditingControllerChangedCallback,
    blockKey: blockKey,
  ));
}

/// Hook for [BlockTextEditingController].
class _BlockTextEditingController extends Hook<BlockTextEditingController> {
  // Properties.
  final BlockCollection _blockCollection;
  final Function(
    Id,
    BlockTextEditingController,
  ) _onBlockTextEditingControllerChangedCallback;
  final GlobalKey _blockKey;

  const _BlockTextEditingController({
    required BlockCollection blockCollection,
    required Function(
      Id,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
    required GlobalKey blockKey,
  })  : _blockCollection = blockCollection,
        _onBlockTextEditingControllerChangedCallback =
            onBlockTextEditingControllerChangedCallback,
        _blockKey = blockKey;

  @override
  _BlockTextEditingControllerState createState() =>
      _BlockTextEditingControllerState(
        blockCollection: _blockCollection,
        onBlockTextEditingControllerChangedCallback:
            _onBlockTextEditingControllerChangedCallback,
        blockKey: _blockKey,
      );
}

/// State for [BlockTextEditingController] hook.
class _BlockTextEditingControllerState
    extends HookState<BlockTextEditingController, _BlockTextEditingController> {
  // Properties.
  final BlockCollection _blockCollection;
  final Function(
    Id,
    BlockTextEditingController,
  ) _onBlockTextEditingControllerChangedCallback;
  final GlobalKey _blockKey;

  // BlockTextEditingController instance.
  late final BlockTextEditingController _blockTextEditingController;

  _BlockTextEditingControllerState({
    required BlockCollection blockCollection,
    required Function(
      Id,
      BlockTextEditingController,
    ) onBlockTextEditingControllerChangedCallback,
    required GlobalKey blockKey,
  })  : _blockCollection = blockCollection,
        _onBlockTextEditingControllerChangedCallback =
            onBlockTextEditingControllerChangedCallback,
        _blockKey = blockKey;

  @override
  void initHook() {
    super.initHook();

    // Create BlockTextEditingController.
    _blockTextEditingController =
        BlockTextEditingController(blockCollection: _blockCollection);

    // Subscribe to changes on the BlockTextEditingController.
    _blockTextEditingController.addListener(() {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        print(BlockView.findRenderEditableFromBlockKey(_blockKey));
        _onBlockTextEditingControllerChangedCallback(
          _blockCollection.id,
          _blockTextEditingController,
        );
      });
    });
  }

  @override
  BlockTextEditingController build(BuildContext context) =>
      _blockTextEditingController;

  @override
  void dispose() {
    _blockTextEditingController.dispose();
    super.dispose();
  }
}
