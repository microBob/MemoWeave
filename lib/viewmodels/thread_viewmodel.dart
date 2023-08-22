import 'package:flutter/material.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/constants.dart';
import 'package:memoweave/utils/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_viewmodel.g.dart';

@riverpod
class ThreadViewModel extends _$ThreadViewModel {
  @override
  ThreadCollection build() {
    return ThreadCollection();
  }

  List<DropdownMenuEntry> spoolsMenuEntries() {
    final spools = ref.watch(spoolsProvider).valueOrNull;
    if (spools != null) {
      return spools
          .map((spool) => DropdownMenuEntry(value: spool, label: spool))
          .toList();
    }
    return [
      const DropdownMenuEntry(
        value: defaultSpoolName,
        label: defaultSpoolName,
      )
    ];
  }
}
