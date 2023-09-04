import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

BlockTextEditingController useBlockTextEditingController(
    {List<Object?>? keys}) {
  return use(_BlockTextEditingController(keys: keys));
}

class _BlockTextEditingController extends Hook<BlockTextEditingController> {
  const _BlockTextEditingController({List<Object?>? keys}) : super(keys: keys);

  @override
  _BlockTextEditingControllerState createState() =>
      _BlockTextEditingControllerState();
}

class _BlockTextEditingControllerState
    extends HookState<BlockTextEditingController, _BlockTextEditingController> {
  late final BlockTextEditingController _blockTextEditingController;

  @override
  void initHook() {
    super.initHook();
    _blockTextEditingController = BlockTextEditingController();
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
