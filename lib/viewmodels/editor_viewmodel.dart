import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  @override
  EditorState build() {
    return EditorState.rootBlock(
      BlockModel.join(
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

  // Getters
  GlobalKey get textKey => state.textKey;

  EdgeInsets get cursorInsets => state.cursorInsets;

  BlockModel get rootBlock => state.rootBlock;

  void handleTap(PointerDownEvent pointerDownEvent) {
    if (kDebugMode) {
      print('Key: ${textKey}');
    }
    RenderParagraph renderParagraph =
        textKey.currentContext?.findRenderObject() as RenderParagraph;
    final tapAsTextPosition =
        renderParagraph.getPositionForOffset(pointerDownEvent.localPosition);
    final caretOffset =
        renderParagraph.getOffsetForCaret(tapAsTextPosition, Rect.zero);
    if (kDebugMode) {
      print(
          'Tap: ${pointerDownEvent.localPosition}; TP: $tapAsTextPosition; Offset: $caretOffset');
    }
  }

  /// Render the text into a [TextSpan]
  TextSpan rootToTextSpan() {
    return _blockModelToTextSpan(state.rootBlock);
  }

  /// Conversion method to build a [TextSpan] from [BlockModel]s
  TextSpan _blockModelToTextSpan(BlockModel root) {
    return TextSpan(
        text: root.text,
        children: root.children
            ?.map((child) => _blockModelToTextSpan(child))
            .toList());
  }
}
