import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/constants.dart';
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
  ThreadCollection build(Id threadId) {
    return ref.watch(getThreadCollectionByIdProvider(id: threadId)).when(
          data: (threadCollection) {
            if (threadCollection == null) {
              throw FormatException("Thread with ID $threadId doesn't exist");
            }
            return threadCollection;
          },
          error: (error, stackFrame) {
            throw FormatException(
                'Unable to load Thread with ID $threadId: $error, $stackFrame');
          },
          loading: () => ThreadCollection(id: threadId),
        );
  }

  /// Get all spools and make [DropdownMenuEntries] from them.
  List<DropdownMenuEntry> spoolsMenuEntries() {
    print('Pulling data');
    final defaultSpools = [
      const DropdownMenuEntry<String>(
        value: defaultSpoolName,
        label: defaultSpoolName,
      ),
    ];
    return ref.watch(spoolsProvider).when(
        data: (spools) {
          print(spools);
          return spools
              .map((spool) =>
                  DropdownMenuEntry<String>(value: spool, label: spool))
              .toList();
        },
        error: (_, __) => defaultSpools,
        loading: () {
          print("Loading");
          return defaultSpools;
        });
  }
}
