import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/widgets/block_widget.dart';

class ThreadView extends ConsumerWidget {
  const ThreadView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Row(
          children: [
            Text('Spool'),
            Expanded(child: TextField()),
            Text('Time'),
          ],
        ),
        const Divider(),
        BlockWidget(
          props: (
            blockId: 3,
            textEditingController: BlockTextEditingController(),
            textFieldFocusNode: FocusNode(),
            textFieldKey: GlobalKey(),
          ),
        ),
      ],
    );
  }
}
