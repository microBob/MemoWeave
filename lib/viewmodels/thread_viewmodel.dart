import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/models/thread_state.dart';
import 'package:memoweave/utils/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_viewmodel.g.dart';

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
@riverpod
class ThreadViewModel extends _$ThreadViewModel {
  @override
  ThreadState build({
    required final DatabaseProps databaseProps,
    required final TextEditingController spoolTextEditingController,
  }) {
    print('Building Thread VC');
    // Subscribe to changes and update state
    databaseProps.databaseManager.onThreadChanged(databaseProps.id).listen(
      (_) {
        print('Thread ${databaseProps.id} changed!');
        ref.invalidateSelf();
        // state = _getState(
        //   databaseProps: databaseProps,
        //   spoolTextEditingController: spoolTextEditingController,
        // );
      },
    );

    return _getState(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
    );
  }

  ThreadState _getState({
    required final DatabaseProps databaseProps,
    required final TextEditingController spoolTextEditingController,
  }) {
    final threadCollection =
        databaseProps.databaseManager.getThreadCollectionById(databaseProps.id);

    if (threadCollection == null) {
      throw FileSystemException(
          'Failed to get Thread of ID ${databaseProps.id}');
    }

    // Set initial spool.
    spoolTextEditingController.text = threadCollection.spool;

    // Add listener to spool changes.
    spoolTextEditingController.addListener(spoolSelectionChanged);

    // Return state.
    return ThreadState(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
      threadCollection: threadCollection,
      cursorRect: Rect.zero,
    );
  }

  List<DropdownMenuEntry> spoolsAsDropdownMenuEntries() {
    return state.databaseProps.databaseManager.spools
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  void spoolSelectionChanged() {
    // Create new Thread.
    final newThreadCollection = state.threadCollection
        .copyWith(spool: state.spoolTextEditingController.text);
    state.databaseProps.databaseManager
        .putThreadCollection(newThreadCollection);
  }

  void subjectChanged(String newSubject) async {
    // Create new Thread
    final newThreadCollection =
        state.threadCollection.copyWith(subject: newSubject);

    // Write to database
    state.databaseProps.databaseManager
        .putThreadCollection(newThreadCollection);
  }
}
