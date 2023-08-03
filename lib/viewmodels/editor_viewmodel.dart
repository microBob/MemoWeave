import 'package:flutter/material.dart';
import 'package:memoweave/models/block_model.dart';

class EditorViewModel {
  BlockModel rootBlock = BlockModel(
    children: [
      BlockModel(text: 'First '),
      BlockModel(text: 'Second ', style: 'bold'),
      BlockModel(text: 'Third\n'),
      BlockModel(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam donec adipiscing tristique risus nec feugiat. Vestibulum morbi blandit cursus risus. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Mattis rhoncus urna neque viverra justo nec ultrices. Molestie nunc non blandit massa enim nec dui nunc mattis. Aliquet bibendum enim facilisis gravida neque. Purus faucibus ornare suspendisse sed nisi lacus. Tristique sollicitudin nibh sit amet commodo nulla facilisi. Cras tincidunt lobortis feugiat vivamus at augue.\n'),
      BlockModel(text: 'My ID\n'),
    ],
  );

  TextSpan rootToTextSpan() {
    return _blockModelToTextSpan(rootBlock);
  }

  TextSpan _blockModelToTextSpan(BlockModel root) {
    return TextSpan(
        text: root.text,
        children: root.children
            .map((child) => _blockModelToTextSpan(child))
            .toList());
  }
}
