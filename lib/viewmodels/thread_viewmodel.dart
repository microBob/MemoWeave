import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/thread_collection.dart';
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
  ThreadState build(Id threadId) {
    return ref.watch(getThreadCollectionByIdProvider(id: threadId)).when(
          data: (threadCollection) {
            if (threadCollection == null) {
              throw FormatException("Thread with ID $threadId doesn't exist");
            }
            return ThreadState(threadCollection: threadCollection);
          },
          error: (error, stackFrame) {
            throw FormatException(
                'Unable to load Thread with ID $threadId: $error, $stackFrame');
          },
          loading: () =>
              ThreadState(threadCollection: ThreadCollection(id: threadId)),
        );
  }

  List<DropdownMenuEntry> setToMenuEntries(Set set) {
    return set
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }
}
