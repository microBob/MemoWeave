import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/editor_props.dart';
import 'package:memoweave/models/editor_state.dart';
import 'package:memoweave/models/text_node.dart';
import 'package:memoweave/utils/database_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editor_viewmodel.g.dart';

/// Text editor logic
///
/// Utilized by [EditorWidget]
@riverpod
class EditorViewModel extends _$EditorViewModel {
  /// Props from the widget
  late EditorProps _props;

  /// Reference to the [TextField]'s [RenderEditable]
  RenderEditable? _renderEditable;

  /// Get props and initialize a default editor.
  @override
  FutureOr<EditorState> build(EditorProps props) async {
    // Populate fields
    _props = props;
    final blockId = props.blockId;

    // Generate default state if not loading previous
    if (blockId == null) {
      final blockCollection = BlockCollection()
        ..text = [
          TextNode.plain(text: 'Hello World'),
          TextNode.plain(text: ' this is a test.'),
          TextNode.plain(text: '\nWith a new paragraph'),
        ];
      return (cursorInsets: EdgeInsets.zero, rootBlock: blockCollection);
    }

    // Load block from database
    final blockCollection =
        await ref.watch(databaseHandlerProvider.notifier).getBlockById(blockId);

    // Return it, otherwise return a blank state
    if (blockCollection != null) {
      return (cursorInsets: EdgeInsets.zero, rootBlock: blockCollection);
    }
    return (cursorInsets: EdgeInsets.zero, rootBlock: BlockCollection());
  }

  /// Search through widget tree to find [RenderEditable]
  Future<void> findRenderEditable([Element? root]) async {
    // Shortcut exit if it has already been found
    if (_renderEditable != null) {
      return;
    }

    // Starter case: No element given, then we start from the TextField's children
    if (root == null) {
      _props.textFieldKey.currentContext?.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
      return;
    }

    // Regular case: Check the current object, then traverse children
    var renderObject = root.renderObject;
    if (renderObject is RenderEditable) {
      _renderEditable = renderObject;
    } else {
      root.visitChildElements((childElement) {
        findRenderEditable(childElement);
      });
    }
  }

  /// Move cursor to where user tapped.
  ///
  /// Tap location given in [pointerDownEvent].
  void handleTap(PointerDownEvent pointerDownEvent) {
    // Update text and selection in text field
    // var node = state.when(
    //   data: (data) =>
    //       data.rootBlock.textNodeWithTextPosition(tapAsTextPosition) ??
    //       TextNode(),
    //   error: (error, stack) => TextNode(),
    //   loading: () => TextNode(),
    // );

  }

  /// Render the text into a [TextSpan].
  TextSpan rootToTextSpan() {
    return _blockModelToTextSpan(state.value!.rootBlock);
  }

  /// Conversion method to build a [TextSpan] from [BlockModel]s.
  TextSpan _blockModelToTextSpan(BlockCollection root) {
    return TextSpan(
      text: root.text.map((textNode) => textNode.text).join(),
      children:
          root.children.map((child) => _blockModelToTextSpan(child)).toList(),
    );
  }
}
