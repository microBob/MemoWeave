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
  final ValueChanged<TextSelection> _onExtentOffsetChanged;
  final TextSelection _cursorExtentOffset;

  /// Constructor that passes [_props].
  const BlockWidget({
    super.key,
    required final DatabaseProps databaseProps,
    required final ValueChanged<TextSelection> onExtentOffsetChanged,
    required final TextSelection cursorExtentOffset,
  })  : _databaseProps = databaseProps,
        _onExtentOffsetChanged = onExtentOffsetChanged,
        _cursorExtentOffset = cursorExtentOffset;

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockTextEditingController =
        useBlockTextEditingController(keys: [_databaseProps]);

    final provider = blockViewModelProvider(
      databaseProps: _databaseProps,
      blockTextEditingController: blockTextEditingController,
      context: context,
      onExtentOffsetChanged: _onExtentOffsetChanged,
      cursorExtentOffset: _cursorExtentOffset,
    );
    final blockState = ref.watch(provider);

    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Focus(
            onKeyEvent: ref.watch(provider.notifier).handleEditorTraversal,
            child: TextField(
              controller: blockTextEditingController,
              textInputAction: TextInputAction.newline,
              maxLines: null,
            ),
          );
        }

        return BlockWidget(
          databaseProps: (
            id: blockState.blockCollection.childrenBlockIds[index - 1],
            databaseManager: _databaseProps.databaseManager,
          ),
          onExtentOffsetChanged: _onExtentOffsetChanged,
          cursorExtentOffset: _cursorExtentOffset,
        );
      },
      itemCount: blockState.blockCollection.childrenBlockIds.length + 1,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
