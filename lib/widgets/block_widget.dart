import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockWidget extends ConsumerWidget {
  BlockWidget({super.key});

  // Props to pass to the ViewModel.
  final BlockProps _props = (
    textFieldKey: GlobalKey(),
    textFieldFocusNode: FocusNode(),
    textEditingController: BlockTextEditingController(),
    blockId: 3,
  );

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Attach to ViewModel.
    ref.watch(blockViewModelProvider(_props));

    // Render TextField.
    return TextField(
      key: _props.textFieldKey,
      focusNode: _props.textFieldFocusNode,
      controller: _props.textEditingController,
      maxLines: null,
    );
  }
}
