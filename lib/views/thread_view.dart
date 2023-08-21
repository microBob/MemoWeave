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
            DropdownMenu(
              initialSelection: 'Note',
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Note', label: 'Note')
              ],
              label: Text('Spool'),
            ),
            Spacer(),
            IntrinsicWidth(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Subject',
                ),
              ),
            ),
            Spacer(),
            Text('Time'),
          ],
        ),
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
