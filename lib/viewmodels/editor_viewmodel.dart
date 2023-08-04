import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_model.dart';

/// Text editor logic
///
/// Utilized by [EditorWidget]
class EditorViewModel {
  /// Root text block for this editor instance
  BlockModel rootBlock = BlockModel.join(
    [
      BlockModel('First '),
      BlockModel('Second ', style: 'bold'),
      BlockModel('Third\n'),
      BlockModel(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam donec adipiscing tristique risus nec feugiat. Vestibulum morbi blandit cursus risus. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Mattis rhoncus urna neque viverra justo nec ultrices. Molestie nunc non blandit massa enim nec dui nunc mattis. Aliquet bibendum enim facilisis gravida neque. Purus faucibus ornare suspendisse sed nisi lacus. Tristique sollicitudin nibh sit amet commodo nulla facilisi. Cras tincidunt lobortis feugiat vivamus at augue.\n'),
      BlockModel('My ID\n'),
    ],
  );

  void handleTap(TapDownDetails details, RenderParagraph renderParagraph) {
    final tapAsTextPosition =
        renderParagraph.getPositionForOffset(details.localPosition);
    final caretOffset =
        renderParagraph.getOffsetForCaret(tapAsTextPosition, Rect.zero);
    print(
        'Tap: ${details.localPosition}; TP: $tapAsTextPosition; Offset: $caretOffset');
  }

  /// Render the text into a [TextSpan]
  TextSpan rootToTextSpan() {
    return _blockModelToTextSpan(rootBlock);
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
