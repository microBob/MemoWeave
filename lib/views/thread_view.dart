import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/utils/constants.dart';
import 'package:memoweave/viewmodels/block_texteditingcontroller.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
import 'package:memoweave/widgets/block_widget.dart';

class ThreadView extends ConsumerWidget {
  final Id threadId;

  const ThreadView({super.key, required this.threadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = threadViewModelProvider(threadId);

    return Column(
      children: [
        // Thread header.
        Row(
          children: [
            // Spool picker.
            DropdownMenu(
              initialSelection: defaultSpoolName,
              dropdownMenuEntries:
                  ref.watch(provider.notifier).spoolsMenuEntries(),
              label: const Text('Spool'),
            ),
            const Spacer(),
            // Thread subject line.
            IntrinsicWidth(
              child: TextFormField(
                initialValue: ref.watch(provider).subject,
                decoration: InputDecoration(
                  hintText: ref.watch(provider).dateTime.toString(),
                ),
              ),
            ),
            const Spacer(),
            // Time stamp.
            Text(ref.watch(provider).dateTime.toString()),
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
