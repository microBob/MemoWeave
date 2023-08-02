import 'package:flutter/material.dart';

/// A single line or "block" of text
///
/// Is an enhanced [TextSpan] that can hold identifying data
class BlockWidget extends TextSpan {
  const BlockWidget({required this.id});

  final String id;

  @override
  List<InlineSpan>? get children => [
        const TextSpan(text: 'First '),
        const TextSpan(
            text: 'Second ', style: TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: 'Third'),
        const TextSpan(text: '\n'),
        const TextSpan(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam donec adipiscing tristique risus nec feugiat. Vestibulum morbi blandit cursus risus. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Mattis rhoncus urna neque viverra justo nec ultrices. Molestie nunc non blandit massa enim nec dui nunc mattis. Aliquet bibendum enim facilisis gravida neque. Purus faucibus ornare suspendisse sed nisi lacus. Tristique sollicitudin nibh sit amet commodo nulla facilisi. Cras tincidunt lobortis feugiat vivamus at augue.'),
        const TextSpan(text: '\n'),
        TextSpan(text: id),
        const TextSpan(text: '\n'),
      ];
}
