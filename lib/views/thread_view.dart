import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/utils/constants.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
import 'package:memoweave/widgets/block_widget.dart';

class ThreadView extends ConsumerWidget {
  const ThreadView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Thread header.
        Row(
          children: [
            // Spool picker.
            DropdownMenu(
              initialSelection: defaultSpoolName,
              dropdownMenuEntries: ref
                  .watch(threadViewModelProvider.notifier)
                  .spoolsMenuEntries(),
              label: const Text('Spool'),
            ),
            const Spacer(),
            // Thread subject line.
            const IntrinsicWidth(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Subject',
                ),
              ),
            ),
            const Spacer(),
            // Time stamp.
            const Text('Time'),
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
