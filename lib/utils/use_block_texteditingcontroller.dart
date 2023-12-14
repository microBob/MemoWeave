import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

/// Hook function for [BlockTextEditingController].
BlockTextEditingController useBlockTextEditingController(
    {required BlockCollection blockCollection}) {
  return use(_BlockTextEditingController(blockCollection: blockCollection));
}

/// Hook for [BlockTextEditingController].
class _BlockTextEditingController extends Hook<BlockTextEditingController> {
  final BlockCollection _blockCollection;

  const _BlockTextEditingController({required BlockCollection blockCollection})
      : _blockCollection = blockCollection;

  @override
  _BlockTextEditingControllerState createState() =>
      _BlockTextEditingControllerState(blockCollection: _blockCollection);
}

/// State for [BlockTextEditingController] hook.
class _BlockTextEditingControllerState
    extends HookState<BlockTextEditingController, _BlockTextEditingController> {
  final BlockCollection _blockCollection;
  late final BlockTextEditingController _blockTextEditingController;

  _BlockTextEditingControllerState({required BlockCollection blockCollection})
      : _blockCollection = blockCollection;

  @override
  void initHook() {
    super.initHook();
    _blockTextEditingController =
        BlockTextEditingController(blockCollection: _blockCollection);
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
