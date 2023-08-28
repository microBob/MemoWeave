import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
import 'package:memoweave/widgets/block_widget.dart';

class ThreadView extends HookConsumerWidget {
  final Id threadId;

  const ThreadView({super.key, required this.threadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Header TextEditingControllers.
    final spoolTextEditingController = useTextEditingController();

    // Provider with props.
    final provider = threadViewModelProvider((
      threadId: threadId,
      spoolTextEditingController: spoolTextEditingController,
    ));

    final threadState = ref.watch(provider).value;

    if (threadState == null) {
      return const CircularProgressIndicator();
    }

    return Column(
      children: [
        // Thread header.
        Row(
          children: [
            // Spool picker.
            DropdownMenu(
              dropdownMenuEntries: ref.watch(spoolsProvider).when(
                    data: (spools) =>
                        ref.watch(provider.notifier).setToMenuEntries(spools),
                    error: (_, __) => [],
                    loading: () => [],
                  ),
              label: const Text('Spool'),
              controller: spoolTextEditingController,
            ),
            const Spacer(),
            // Thread subject line.
            IntrinsicWidth(
              child: TextFormField(
                initialValue: threadState.threadCollection.subject,
                decoration: InputDecoration(
                  hintText: threadState.threadCollection.dateTimeAsDate(),
                ),
                onChanged: ref.watch(provider.notifier).subjectChanged,
              ),
            ),
            const Spacer(),
            // Time stamp.
            Text(threadState.threadCollection.dateTimeAsTime(context)),
          ],
        ),
        Column(
          children: threadState.threadCollection.blocks
              .map((block) => BlockWidget(
                    props: (textFieldKey: GlobalKey(), blockCollection: block),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
