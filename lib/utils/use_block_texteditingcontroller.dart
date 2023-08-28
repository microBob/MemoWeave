import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

BlockTextEditingController useBlockTextEditingController() {
  return use(const _BlockTextEditingController());
}

class _BlockTextEditingController extends Hook<BlockTextEditingController> {
  const _BlockTextEditingController();

  @override
  _BlockTextEditingControllerState createState() =>
      _BlockTextEditingControllerState();
}

class _BlockTextEditingControllerState
    extends HookState<BlockTextEditingController, _BlockTextEditingController> {
  late final BlockTextEditingController textEditingController;

  @override
  void initHook() {
    super.initHook();
    textEditingController = BlockTextEditingController();
  }

  @override
  BlockTextEditingController build(BuildContext context) =>
      textEditingController;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
