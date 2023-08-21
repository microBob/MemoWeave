import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockWidget extends ConsumerWidget {
  /// Properties for this Block.
  final BlockProps props;

  /// Constructor that passes [props].
  const BlockWidget({super.key, required this.props});

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Attach to ViewModel.
    ref.watch(blockViewModelProvider(props));

    // Render TextField.
    return TextField(
      key: props.textFieldKey,
      focusNode: props.textFieldFocusNode,
      controller: props.textEditingController,
      maxLines: null,
    );
  }
}
