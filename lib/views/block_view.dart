import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoweave/models/block_callback_props.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/utils/use_block_texteditingcontroller.dart';

import '../models/block_texteditingcontroller_props.dart';

/// Block View.
///
/// An atomic chunk of information.
/// The view is stateless, but the used views may have state.
class BlockView extends HookWidget {
  /// Properties for this Block.
  final BlockProps _blockProps;

  /// Generative constructor.
  const BlockView({
    super.key,
    required final BlockProps blockProps,
  }) : _blockProps = blockProps;

  /// Build UI.
  @override
  Widget build(BuildContext context) {
    // Components.
    final blockTextEditingController = useBlockTextEditingController(
      keys: [_blockProps],
      blockTextEditingControllerProps: BlockTextEditingControllerProps(
        blockCollection: _blockProps.blockCollectionTreeNode.blockCollection,
        onBlockTextEditingControllerChangedCallback:
            _blockProps.onBlockTextEditingControllerChangedCallback,
      ),
    );
    final blockCallbackProps = BlockCallbackProps(
      blockCollection: _blockProps.blockCollectionTreeNode.blockCollection,
      blockTextEditingController: blockTextEditingController,
      blockRenderEditable: () => _findRenderEditableFromBlockKey(context),
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
        // Start with this Block.
        if (index == 0) {
          return TextField(
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
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  /// Find [RenderEditable] in the widget tree from the given build [context].
  RenderEditable _findRenderEditableFromBlockKey(BuildContext context) {
    // Search for RenderEditable in child elements.
    RenderEditable? output;

    /// Find RenderEditable within child elements of the given element.
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

    context.visitChildElements((childElement) {
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
          'Unable to find RenderEditable from context: $context');
    }

    // Otherwise return RenderEditable.
    return output!;
  }
}
