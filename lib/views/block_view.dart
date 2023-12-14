import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

/// Text editor interface.
///
/// Renders text and handles input.
class BlockView extends HookWidget {
  /// Properties for this Block.
  final BlockProps _blockProps;

  /// Generative constructor.
  const BlockView({
    super.key,
    required final BlockProps blockProps,
  }) : _blockProps = blockProps;

  /// Attach to [BlockViewModel] and build UI.
  @override
  Widget build(BuildContext context) {
    final blockTextEditingController = useBlockTextEditingController(
        blockCollection: _blockProps.blockCollectionTreeNode.blockCollection);
    final blockKey = GlobalKey();
    final blockFocusNode = useFocusNode();

    return ListView.builder(
      itemBuilder: (context, index) {
        // Start with this block
        if (index == 0) {
          return Focus(
            onKeyEvent: _blockProps.onEditorTraversalCallback,
            child: TextField(
              key: blockKey,
              autofocus:
                  _blockProps.blockCollectionTreeNode.blockCollection.id ==
                      _blockProps.idOfBlockInFocus,
              controller: blockTextEditingController,
              focusNode: blockFocusNode,
              textInputAction: TextInputAction.newline,
              maxLines: null,
            ),
          );
        }

        // Then build the rest of the children.
        return BlockView(
          blockProps: _blockProps.copyWith(
            blockCollectionTreeNode:
                _blockProps.blockCollectionTreeNode.childBlocks[index - 1],
          ),
        );
      },
      itemCount: _blockProps.blockCollectionTreeNode.childBlocks.length + 1,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
