import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:memoweave/models/block_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/editor_state.dart';

part 'editor_viewmodel.g.dart';

@riverpod
Future<String> fetchDatabase(FetchDatabaseRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

/// Text editor logic
///
/// Utilized by [EditorWidget]
@riverpod
class EditorViewModel extends _$EditorViewModel {
  // Initialize a default editor
  @override
  EditorState build(GlobalKey textKey) {
    return EditorState.rootBlock(
      textKey: textKey,
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

  /// Cached reference to the text's [RenderParagraph]
  RenderParagraph? _renderParagraph;

  void handleTap(PointerDownEvent pointerDownEvent) {
    // RenderParagraph may not have been found yet
    if (_renderParagraph == null) {
      // Extract RenderParagraph from key
      // Widget tree should be Text -> MouseRegion -> RichText (RenderParagraph)
      textKey.currentContext?.visitChildElements((element) {
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
      textKey: textKey,
      cursorInsets: EdgeInsets.only(left: caretOffset.dx, top: caretOffset.dy),
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
