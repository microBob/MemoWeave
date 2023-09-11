import 'package:flutter/material.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_viewmodel.g.dart';

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
@riverpod
class ThreadViewModel extends _$ThreadViewModel {
  @override
  ThreadCollection build({
    required final DatabaseProps databaseProps,
    required final TextEditingController spoolTextEditingController,
  }) {
    final threadCollection =
        databaseProps.databaseManager.getThreadCollectionById(databaseProps.id);

    // Set initial spool.
    spoolTextEditingController.text = threadCollection.spool;

    // Add listener to spool changes.
    spoolTextEditingController.addListener(spoolSelectionChanged);

    // Subscribe to changes and update state
    databaseProps.databaseManager.onThreadChanged(databaseProps.id).listen(
      (threadCollection) {
        if (threadCollection == null) return;
        state = threadCollection;
      },
    );

    // Return state.
    return threadCollection;
  }

  List<DropdownMenuEntry> spoolsAsDropdownMenuEntries() {
    return databaseProps.databaseManager.spools
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  void spoolSelectionChanged() {
    if (!spoolTextEditingController.selection.isValid) return;
    // Create new Thread.
    final newThreadCollection =
        state.copyWith(spool: spoolTextEditingController.text);
    databaseProps.databaseManager.putThreadCollection(newThreadCollection);
  }

  void subjectChanged(String newSubject) async {
    // Create new Thread
    final newThreadCollection = state.copyWith(subject: newSubject);

    // Write to database
    databaseProps.databaseManager.putThreadCollection(newThreadCollection);
  }
}
