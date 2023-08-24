import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  List<DropdownMenuEntry> setToMenuEntries(Set set) {
    return set
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  List<DropdownMenuEntry> defaultSpoolManuEntries() => [
        const DropdownMenuEntry(
            value: defaultSpoolName, label: defaultSpoolName)
      ];

  String dateFromDateTime() => DateFormat.yMMMMEEEEd().format(state.dateTime);

  String timeFromDateTime(BuildContext context) =>
      MediaQuery.of(context).alwaysUse24HourFormat
          ? DateFormat.Hm().format(state.dateTime)
          : DateFormat.jm().format(state.dateTime);
}
