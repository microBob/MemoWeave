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
    final spoolTextEditingController =
        useTextEditingController(keys: [_databaseProps]);

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
                initialValue: threadState.subject,
                decoration: InputDecoration(
                  hintText: threadState.dateTimeAsDate(),
                ),
                onChanged: ref.watch(provider.notifier).subjectChanged,
              ),
            ),
            const Spacer(),
            // Time stamp.
            Text(threadState.dateTimeAsTime(context)),
          ],
        ),
        ListView.builder(
          itemBuilder: (context, index) => BlockWidget(
            databaseProps: (
              id: threadState.childIds[index],
              databaseManager: _databaseProps.databaseManager
            ),
          ),
          itemCount: threadState.childIds.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
      ],
    );
  }
}
