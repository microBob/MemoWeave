import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/models/block_callback_props.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/block_viewmodel.dart';

import '../models/block_texteditingcontroller_props.dart';

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
    // Components.
    final blockKey = GlobalKey();
    final blockTextEditingController = useBlockTextEditingController(
      blockTextEditingControllerProps: BlockTextEditingControllerProps(
        blockCollection: _blockProps.blockCollectionTreeNode.blockCollection,
        onBlockTextEditingControllerChangedCallback:
            _blockProps.onBlockTextEditingControllerChangedCallback,
      ),
    );
    final blockCallbackProps = BlockCallbackProps(
      blockCollection: _blockProps.blockCollectionTreeNode.blockCollection,
      blockTextEditingController: blockTextEditingController,
      blockRenderEditable: () => _findRenderEditableFromBlockKey(blockKey),
    );
    final blockFocusNode = useFocusNode(
      debugLabel:
          'Block ${_blockProps.blockCollectionTreeNode.blockCollection.id}',
      onKeyEvent: (focusNode, event) => _blockProps.onKeyEventCallback(
        focusNode,
        event,
        blockCallbackProps,
      ),
    );

    // Initialize block focus and caret after widgets are built.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _blockProps.initBlockFocusAndCaret(
        blockFocusNode,
        blockCallbackProps,
      ),
    );

    return ListView.builder(
      itemBuilder: (_, index) {
        // Start with this block
        if (index == 0) {
          return TextField(
            key: blockKey,
            focusNode: blockFocusNode,
            controller: blockTextEditingController,
            textInputAction: TextInputAction.newline,
            maxLines: null,
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

  RenderEditable _findRenderEditableFromBlockKey(GlobalKey blockKey) {
    // Search for RenderEditable in child elements.
    RenderEditable? output;

    RenderEditable? findRenderEditableFromElement(Element element) {
      var renderObject = element.renderObject;
      if (renderObject is RenderEditable) {
        return renderObject;
      } else {
        RenderEditable? output;
        element.visitChildElements((childElement) {
          // Shortcut exit if RenderEditable already found.
          if (output != null) return;

          // Search for RenderEditable in child element.
          final potentialRenderEditable =
              findRenderEditableFromElement(childElement);

          // There should only be 1, so as soon as we find it,
          if (potentialRenderEditable != null) {
            output = potentialRenderEditable;
          }
        });

        return output;
      }
    }

    blockKey.currentContext?.visitChildElements((childElement) {
      // Shortcut exit if RenderEditable already found.
      if (output != null) return;

      // Search for RenderEditable in child element.
      final potentialRenderEditable =
          findRenderEditableFromElement(childElement);

      // There should only be 1, so as soon as we find it,
      if (potentialRenderEditable != null) {
        output = potentialRenderEditable;
      }
    });

    // Throw error if no RenderEditable found.
    if (output == null) {
      throw FormatException(
          'Unable to find RenderEditable from key: $blockKey');
    }

    // Otherwise return RenderEditable.
    return output!;
  }
}
