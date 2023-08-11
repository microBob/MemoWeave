import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/editor_state.dart';

part 'editor_viewmodel.g.dart';

/// Text editor logic
///
/// Utilized by [EditorWidget]
@riverpod
class EditorViewModel extends _$EditorViewModel {
  /// Key used to access the [RenderParagraph]
  late GlobalKey _textKey;

  /// [FocusNode] used to control and handle input
  late FocusNode _inputFocusNode;

  /// Reference to the text's [RenderParagraph]
  RenderParagraph? _renderParagraph;

  /// Get props and initialize a default editor
  @override
  EditorState build(GlobalKey textKey, FocusNode inputFocusNode) {
    _textKey = textKey;
    _inputFocusNode = inputFocusNode;

    return EditorState.rootBlock(
      rootBlock: BlockModel.join(
        [
          BlockModel('First '),
          BlockModel('Second ', style: 'bold'),
          BlockModel('Third\n'),
          BlockModel(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam donec adipiscing tristique risus nec feugiat. Vestibulum morbi blandit cursus risus. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Mattis rhoncus urna neque viverra justo nec ultrices. Molestie nunc non blandit massa enim nec dui nunc mattis. Aliquet bibendum enim facilisis gravida neque. Purus faucibus ornare suspendisse sed nisi lacus. Tristique sollicitudin nibh sit amet commodo nulla facilisi. Cras tincidunt lobortis feugiat vivamus at augue.\n'),
          BlockModel('My ID\n'),
        ],
      ),
    );
  }

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
    state = EditorState.copy(
      cursorInsets: EdgeInsets.only(
        left: max(0, caretOffset.dx),
        top: max(0, caretOffset.dy),
      ),
      rootBlock: state.rootBlock,
    );
  }

  /// Render the text into a [TextSpan]
  TextSpan rootToTextSpan() {
    return _blockModelToTextSpan(state.rootBlock);
  }

  /// Conversion method to build a [TextSpan] from [BlockModel]s
  TextSpan _blockModelToTextSpan(BlockModel root) {
    return TextSpan(
      text: root.text,
      children:
          root.children?.map((child) => _blockModelToTextSpan(child)).toList(),
    );
  }
}
