import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/text_node.dart';
import 'package:memoweave/utils/database_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/editor_state.dart';

part 'editor_viewmodel.g.dart';

/// Text editor logic
///
/// Utilized by [EditorWidget]
@riverpod
class EditorViewModel extends _$EditorViewModel {
  /// Key used to access the [RenderParagraph].
  late GlobalKey _textKey;

  /// [FocusNode] used to control and handle input.
  late FocusNode _inputFocusNode;

  /// Reference to the text's [RenderParagraph].
  RenderParagraph? _renderParagraph;

  /// Get props and initialize a default editor.
  @override
  FutureOr<EditorState> build(GlobalKey textKey, FocusNode inputFocusNode,
      [Id? blockId]) async {
    // Populate fields
    _textKey = textKey;
    _inputFocusNode = inputFocusNode;

    // Generate default state if not loading previous
    if (blockId == null) {
      final blockCollection = BlockCollection()
        ..text = [
          TextNode.plain(text: 'Hello World'),
          TextNode.plain(text: ' this is a test.')
        ];

      return EditorState.rootBlock(rootBlock: blockCollection);
    }

    // Load block from database
    final blockCollection =
        await ref.watch(databaseHandlerProvider.notifier).getBlockById(blockId);

    // Return it, otherwise return a blank state
    if (blockCollection != null) {
      return EditorState.rootBlock(rootBlock: blockCollection);
    }
    return EditorState();
  }

  /// Move cursor to where user tapped.
  ///
  /// Tap location given in [pointerDownEvent].
  void handleTap(PointerDownEvent pointerDownEvent) {
    // Get input focus
    _inputFocusNode.requestFocus();

    // RenderParagraph may not have been found yet
    if (_renderParagraph == null) {
      // Extract RenderParagraph from key
      // Widget tree should be Text -> MouseRegion -> RichText (RenderParagraph)
      _textKey.currentContext?.visitChildElements((element) {
        // This should be the MouseRegion
        element.visitChildElements((element) {
          // This should be the RichText
          if (element.findRenderObject() is RenderParagraph) {
            _renderParagraph = element.findRenderObject() as RenderParagraph;
          } else {
            throw const FormatException(
                'Could not find RenderParagraph with the given key');
          }
        });
      });
    }

    // Compute cursor location
    final tapAsTextPosition =
        _renderParagraph!.getPositionForOffset(pointerDownEvent.localPosition);
    final caretOffset =
        _renderParagraph!.getOffsetForCaret(tapAsTextPosition, Rect.zero);

    // Update the cursor location in state
    state = AsyncValue.data(
      EditorState.copy(
        cursorInsets: EdgeInsets.only(
          left: max(0, caretOffset.dx),
          top: max(0, caretOffset.dy),
        ),
        rootBlock: state.value!.rootBlock,
      ),
    );
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