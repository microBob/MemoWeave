import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:memoweave/models/block_props.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
import 'package:memoweave/views/block_view.dart';

class ThreadView extends HookConsumerWidget {
  final DatabaseProps _databaseProps;

  const ThreadView({super.key, required final DatabaseProps databaseProps})
      : _databaseProps = databaseProps;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Header TextEditingControllers.
    final spoolTextEditingController =
        useTextEditingController(keys: [_databaseProps]);
    final subjectTextEditingController =
        useTextEditingController(keys: [_databaseProps]);

    // Provider with props.
    final provider = threadViewModelProvider(
      databaseProps: _databaseProps,
      spoolTextEditingController: spoolTextEditingController,
      subjectTextEditingController: subjectTextEditingController,
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
                // Placeholder with current date.
                decoration: InputDecoration(
                  hintText: DateFormat.yMMMMEEEEd()
                      .format(threadState.threadCollection.dateTime),
                ),
                controller: subjectTextEditingController,
              ),
            ),
            const Spacer(),
            // Time stamp (use 24-hour preference).
            Text(
              MediaQuery.of(context).alwaysUse24HourFormat
                  ? DateFormat.Hm()
                      .format(threadState.threadCollection.dateTime)
                  : DateFormat.jm()
                      .format(threadState.threadCollection.dateTime),
            )
          ],
        ),
        ListView.builder(
          itemBuilder: (context, index) => BlockView(
            blockProps: BlockProps(
              blockCollectionTreeNode:
                  threadState.blockCollectionTreeNodes[index],
              idOfBlockInFocus: threadState.idOfBlockInFocus,
              onKeyEventCallback:
                  ref.watch(provider.notifier).onKeyEventCallback,
              onFocusChangedCallback:
                  ref.watch(provider.notifier).onFocusChangedCallback,
              onBlockTextEditingControllerChangedCallback: ref
                  .watch(provider.notifier)
                  .onBlockTextEditingControllerChangedCallback,
            ),
          ),
          itemCount: threadState.blockCollectionTreeNodes.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
      ],
    );
  }
}
