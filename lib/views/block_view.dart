import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    // Components.
    final blockTextEditingController = useBlockTextEditingController(
      blockCollection: _blockProps.blockCollectionTreeNode.blockCollection,
    );
    final blockKey = GlobalKey();

    // Subscribe to changes on the BlockTextEditingController
    blockTextEditingController.addListener(() {
      _blockProps.onBlockTextEditingControllerChangedCallback(
        blockTextEditingController,
        _blockProps.blockCollectionTreeNode.blockCollection.id,
      );
    });

    return ListView.builder(
      itemBuilder: (context, index) {
        // Start with this block
        if (index == 0) {
          return Focus(
            onKeyEvent: (node, event) => _blockProps.onKeyEventCallback(
              node,
              event,
              _blockProps.blockCollectionTreeNode.blockCollection.id,
              _findRenderEditableFromBlockKey(blockKey),
              blockTextEditingController,
            ),
            onFocusChange: (hasFocus) => _blockProps.onFocusChangedCallback(
              hasFocus,
              _blockProps.blockCollectionTreeNode.blockCollection.id,
              blockTextEditingController,
            ),
            child: TextField(
              key: blockKey,
              autofocus:
                  _blockProps.blockCollectionTreeNode.blockCollection.id ==
                      _blockProps.idOfBlockInFocus,
              controller: blockTextEditingController,
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

  RenderEditable _findRenderEditableFromBlockKey(GlobalKey blockKey) {
    // Search for RenderEditable in child elements.
    RenderEditable? output;
    blockKey.currentContext?.visitChildElements((childElement) {
      // Shortcut exit if RenderEditable already found.
      if (output != null) return;

      // Search for RenderEditable in child element.
      final potentialRenderEditable =
          _findRenderEditableFromElement(childElement);

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

  RenderEditable? _findRenderEditableFromElement(Element element) {
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
            _findRenderEditableFromElement(childElement);

        // There should only be 1, so as soon as we find it,
        if (potentialRenderEditable != null) {
          output = potentialRenderEditable;
        }
      });

      return output;
    }
  }
}
