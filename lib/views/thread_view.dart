import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
import 'package:memoweave/widgets/block_widget.dart';

class ThreadView extends HookConsumerWidget {
  final DatabaseProps _databaseProps;

  const ThreadView({super.key, required final DatabaseProps databaseProps})
      : _databaseProps = databaseProps;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Header TextEditingControllers.
    final spoolTextEditingController = useTextEditingController();

    // Provider with props.
    final provider = threadViewModelProvider(
      databaseProps: _databaseProps,
      spoolTextEditingController: spoolTextEditingController,
    );

    final threadState = ref.watch(provider);

    return Column(
      children: [
        // Thread header.
        Row(
          children: [
            // Spool picker.
            DropdownMenu(
              dropdownMenuEntries:
                  ref.watch(provider.notifier).spoolsAsDropdownMenuEntries(),
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
        FocusTraversalGroup(
          child: Column(
            children: threadState.threadCollection.blockIds
                .map((blockId) => BlockWidget(
                      databaseProps: (
                        id: blockId,
                        databaseManager: _databaseProps.databaseManager,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
