import 'package:flutter/material.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/models/thread_props.dart';
import 'package:memoweave/models/thread_state.dart';
import 'package:memoweave/utils/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_viewmodel.g.dart';

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
@riverpod
class ThreadViewModel extends _$ThreadViewModel {
  /// Construct or retrieve the data for a Thread.
  @override
  ThreadState build(ThreadProps props) {
    props.spoolTextEditingController.addListener(spoolSelectionChanged);

    return ref.watch(getThreadCollectionByIdProvider(id: props.threadId)).when(
          data: (threadCollection) {
            if (threadCollection == null) {
              throw FormatException(
                  "Thread with ID ${props.threadId} doesn't exist");
            }
            return ThreadState(threadCollection: threadCollection);
          },
          error: (error, stackFrame) {
            throw FormatException(
                'Unable to load Thread with ID ${props.threadId}: $error, $stackFrame');
          },
          loading: () => ThreadState(
              threadCollection: ThreadCollection(id: props.threadId)),
        );
  }

  List<DropdownMenuEntry> setToMenuEntries(Set set) {
    return set
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  void spoolSelectionChanged() async {
    // Create new Thread
    final newThreadCollection = state.threadCollection
        .copyWith(spool: props.spoolTextEditingController.text);

    // Write to database
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putThreadCollection(newThreadCollection);

    // Update state
    state = state.copyWith(threadCollection: newThreadCollection);
  }

  void subjectChanged(String newSubject) async {
    // Create new Thread
    final newThreadCollection =
        state.threadCollection.copyWith(subject: newSubject);

    // Write to database
    final databaseManager = await ref.read(databaseManagerProvider.future);
    databaseManager.putThreadCollection(newThreadCollection);

    // Update state
    state = state.copyWith(threadCollection: newThreadCollection);
  }
}
