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
  ThreadCollection build(Id? threadId) {
    final defaultThreadCollection = ThreadCollection();

    if (threadId == null) {
      return defaultThreadCollection;
    }

    return ref
            .watch(getThreadCollectionByIdProvider(id: threadId))
            .valueOrNull ??
        defaultThreadCollection;
  }

  /// Get all spools and make [DropdownMenuEntries] from them.
  List<DropdownMenuEntry> spoolsMenuEntries() {
    return ref
            .watch(spoolsProvider)
            .valueOrNull
            ?.map((spool) => DropdownMenuEntry(value: spool, label: spool))
            .toList() ??
        [
          const DropdownMenuEntry(
            value: defaultSpoolName,
            label: defaultSpoolName,
          ),
        ];
  }
}
