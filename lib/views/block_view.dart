import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/utils/id_of_block_in_focus.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockView extends HookConsumerWidget {
  /// Properties for this Block.
  final DatabaseProps _databaseProps;

  /// Constructor that passes [_props].
  const BlockView({
    super.key,
    required final DatabaseProps databaseProps,
  }) : _databaseProps = databaseProps;

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockTextEditingController =
        useBlockTextEditingController(keys: [_databaseProps]);
    final blockKey = GlobalKey();
    final blockFocusNode = useFocusNode();

    if (ref.watch(idOfBlockInFocusProvider).blockId == _databaseProps.id) {
      blockFocusNode.requestFocus();
    }

    final provider = blockViewModelProvider(
      databaseProps: _databaseProps,
      blockKey: blockKey,
      blockTextEditingController: blockTextEditingController,
    );
    final blockState = ref.watch(provider);

    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Focus(
            onKeyEvent: ref.watch(provider.notifier).handleEditorTraversal,
            onFocusChange: ref.watch(provider.notifier).onFocusChanged,
            child: TextField(
              key: blockKey,
              controller: blockTextEditingController,
              focusNode: blockFocusNode,
              textInputAction: TextInputAction.newline,
              maxLines: null,
            ),
          );
        }

        return BlockView(
          databaseProps: (
            id: blockState.childIds[index - 1],
            databaseManager: _databaseProps.databaseManager,
          ),
        );
      },
      itemCount: blockState.childIds.length + 1,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
