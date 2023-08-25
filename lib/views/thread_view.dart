import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/database.dart';
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
              initialSelection: ref.watch(provider).threadCollection.spool,
              dropdownMenuEntries: ref.watch(spoolsProvider).when(
                    data: (spools) =>
                        ref.watch(provider.notifier).setToMenuEntries(spools),
                    error: (_, __) => ThreadCollection.defaultSpoolMenuEntries,
                    loading: () => ThreadCollection.defaultSpoolMenuEntries,
                  ),
              label: const Text('Spool'),
            ),
            const Spacer(),
            // Thread subject line.
            IntrinsicWidth(
              child: TextFormField(
                initialValue: ref.watch(provider).threadCollection.subject,
                decoration: InputDecoration(
                  hintText: ref.watch(provider).threadCollection.dateTimeAsDate,
                ),
              ),
            ),
            const Spacer(),
            // Time stamp.
            Text(ref.watch(provider).threadCollection.dateTimeAsTime(context)),
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
