import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/block_props.dart';
import '../models/database_props.dart';
import '../viewmodels/thread_viewmodel.dart';
import 'block_view.dart';

/// Thread View.
///
/// The standard unit of a note on a single topic.
/// Is stateful and manages the state and interaction of its [BlockView]s.
class ThreadView extends HookConsumerWidget {
  /// Properties for this Thread.
  final DatabaseProps _databaseProps;

  /// Generative constructor.
  const ThreadView({
    super.key,
    required final DatabaseProps databaseProps,
  }) : _databaseProps = databaseProps;

  /// Build UI and attach to [ThreadViewModel].
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Header TextEditingControllers.
    final spoolTextEditingController =
        useTextEditingController(keys: [_databaseProps]);
    final subjectTextEditingController =
        useTextEditingController(keys: [_databaseProps]);

    // View model provider.
    final provider = threadViewModelProvider(
      databaseProps: _databaseProps,
      spoolTextEditingController: spoolTextEditingController,
      subjectTextEditingController: subjectTextEditingController,
    );

    // Attach to view model and get state.
    final threadState = ref.watch(provider);

    return Column(
      children: [
        // Thread header.
        Row(
          children: [
            // Spool picker.
            DropdownMenu<String>(
              dropdownMenuEntries:
                  ref.watch(provider.notifier).spoolsAsDropdownMenuEntries(),
              label: const Text('Spool'),
              controller: spoolTextEditingController,
            ),

            const Spacer(),

            // Thread subject line.
            IntrinsicWidth(
              child: TextField(
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
            Focus(
              canRequestFocus: false,
              child: Text(
                MediaQuery.of(context).alwaysUse24HourFormat
                    ? DateFormat.Hm()
                        .format(threadState.threadCollection.dateTime)
                    : DateFormat.jm()
                        .format(threadState.threadCollection.dateTime),
              ),
            )
          ],
        ),

        // Thread body.
        ListView.builder(
          itemBuilder: (context, index) => BlockView(
            blockProps: BlockProps(
              blockCollectionTreeNode:
                  threadState.blockCollectionTreeNodes[index],
              onKeyEventCallback:
                  ref.watch(provider.notifier).onKeyEventCallback,
              initBlockFocusAndCaret:
                  ref.watch(provider.notifier).initBlockFocusAndCaret,
              onBlockTextEditingControllerChangedCallback: ref
                  .watch(provider.notifier)
                  .onBlockTextEditingControllerChangedCallback,
            ),
          ),
          itemCount: threadState.blockCollectionTreeNodes.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
