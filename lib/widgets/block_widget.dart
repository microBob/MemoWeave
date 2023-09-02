import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockWidget extends HookConsumerWidget {
  /// Properties for this Block.
  final DatabaseProps _databaseProps;

  /// Constructor that passes [_props].
  const BlockWidget({super.key, required final DatabaseProps databaseProps})
      : _databaseProps = databaseProps;

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockTextEditingController = useBlockTextEditingController();
    final provider = blockViewModelProvider(
      databaseProps: _databaseProps,
      blockTextEditingController: blockTextEditingController,
    );
    // ref.watch(provider);

    return Column(
      children: [
        Focus(
          onKeyEvent: (node, event) {
            ref.watch(provider.notifier).handleEditorTraversal(node, event);
            return KeyEventResult.ignored;
          },
          child: TextField(
            controller: blockTextEditingController,
            textInputAction: TextInputAction.newline,
            // maxLines: null,
          ),
        ),
        // ..._props.blockCollection.children
        //     .map((block) => BlockWidget(props: (
        //           textFieldKey: GlobalKey(),
        //           blockCollection: block,
        //         )))
        //     .toList()
      ],
    );
  }
}
