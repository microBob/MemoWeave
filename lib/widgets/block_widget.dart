import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockWidget extends HookConsumerWidget {
  /// Properties for this Block.
  final BlockProps _props;

  /// Constructor that passes [_props].
  const BlockWidget({super.key, required BlockProps props}) : _props = props;

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockTextEditingController = useBlockTextEditingController();
    final provider = blockViewModelProvider(
      props: _props,
      blockTextEditingController: blockTextEditingController,
    );

    return Focus(
      onKeyEvent: ref.watch(provider.notifier).handleEditorTraversal,
      child: Column(
        children: [
          TextField(
            key: _props.textFieldKey,
            controller: blockTextEditingController,
            textInputAction: TextInputAction.newline,
            maxLines: null,
          ),
          ..._props.blockCollection.children
              .map((block) => BlockWidget(props: (
                    textFieldKey: GlobalKey(),
                    blockCollection: block,
                  )))
              .toList()
        ],
      ),
    );
  }
}
