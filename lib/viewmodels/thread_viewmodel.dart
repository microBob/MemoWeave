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

    // Subscribe to changes and update state
    databaseProps.databaseManager.onThreadChanged(databaseProps.id).listen(
      (threadCollection) {
        state = state.copyWith(threadCollection: threadCollection);
      },
    );

    // Return state.
    return ThreadState(
      threadCollection: threadCollection,
      cursorRect: Rect.zero,
      cursorExtentOffset: const TextSelection.collapsed(offset: 0),
    );
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
        state.threadCollection.copyWith(spool: spoolTextEditingController.text);
    databaseProps.databaseManager.putThreadCollection(newThreadCollection);
  }

  void subjectChanged(String newSubject) async {
    // Create new Thread
    final newThreadCollection =
        state.threadCollection.copyWith(subject: newSubject);

    // Write to database
    databaseProps.databaseManager.putThreadCollection(newThreadCollection);
  }

  void onCursorExtentOffsetChanged(TextSelection offset) {
    state = state.copyWith(cursorExtentOffset: offset);
  }

  TextSelection getCursorExtentOffset() {
    return state.cursorExtentOffset;
  }
}
