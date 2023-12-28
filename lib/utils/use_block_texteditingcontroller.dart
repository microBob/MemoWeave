import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/models/block_texteditingcontroller_props.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';

/// Hook function for [BlockTextEditingController].
BlockTextEditingController useBlockTextEditingController({
  required List keys,
  required BlockTextEditingControllerProps blockTextEditingControllerProps,
}) =>
    use(
      _BlockTextEditingController(
        keys: keys,
        blockTextEditingControllerProps: blockTextEditingControllerProps,
      ),
    );

/// Hook for [BlockTextEditingController].
class _BlockTextEditingController extends Hook<BlockTextEditingController> {
  final BlockTextEditingControllerProps _blockTextEditingControllerProps;

  const _BlockTextEditingController({
    required super.keys,
    required BlockTextEditingControllerProps blockTextEditingControllerProps,
  }) : _blockTextEditingControllerProps = blockTextEditingControllerProps;

  @override
  _BlockTextEditingControllerState createState() =>
      _BlockTextEditingControllerState(
          blockTextEditingControllerProps: _blockTextEditingControllerProps);
}

/// State for [BlockTextEditingController] hook.
class _BlockTextEditingControllerState
    extends HookState<BlockTextEditingController, _BlockTextEditingController> {
  final BlockTextEditingControllerProps _blockTextEditingControllerProps;
  late final BlockTextEditingController _blockTextEditingController;

  _BlockTextEditingControllerState({
    required BlockTextEditingControllerProps blockTextEditingControllerProps,
  }) : _blockTextEditingControllerProps = blockTextEditingControllerProps;

  @override
  void initHook() {
    super.initHook();
    _blockTextEditingController = BlockTextEditingController(
      blockCollection: _blockTextEditingControllerProps.blockCollection,
    );

    // Subscribe to changes in the text editing controller.
    _blockTextEditingController.addListener(() {
      _blockTextEditingControllerProps
          .onBlockTextEditingControllerChangedCallback(
        _blockTextEditingControllerProps.blockCollection,
        _blockTextEditingController,
      );
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
