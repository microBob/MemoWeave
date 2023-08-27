import 'package:flutter/material.dart';
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
  @override
  FutureOr<ThreadState> build(ThreadProps props) async {
    // Get latest state.
    final state = await _getState();

    // Set initial spool.
    props.spoolTextEditingController.text = state.threadCollection.spool;

    // Add listener to spool changes.
    props.spoolTextEditingController.addListener(spoolSelectionChanged);

    // Return state.
    return state;
  }

  Future<ThreadState> _getState() async {
    final databaseManager = await ref.read(databaseManagerProvider.future);
    final threadCollection =
        await databaseManager.getThreadCollectionById(props.threadId);
    return ThreadState(
        threadCollection: threadCollection!, cursorRect: Rect.zero);
  }

  /// Construct or retrieve the data for a Thread.

  List<DropdownMenuEntry> setToMenuEntries(Set set) {
    return set
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  Future<void> spoolSelectionChanged() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final currentState = await _getState();

      // Create new Thread.
      final newThreadCollection = currentState.threadCollection
          .copyWith(spool: props.spoolTextEditingController.text);

      // Write to database.
      final databaseManager = await ref.read(databaseManagerProvider.future);
      await databaseManager.putThreadCollection(newThreadCollection);

      // Prompt spools list to recompute.
      ref.invalidate(spoolsProvider);

      // Return state on completion.
      return _getState();
    });
  }

  Future<void> subjectChanged(String newSubject) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final currentState = await _getState();

      // Create new Thread
      final newThreadCollection =
          currentState.threadCollection.copyWith(subject: newSubject);

      // Write to database
      final databaseManager = await ref.read(databaseManagerProvider.future);
      databaseManager.putThreadCollection(newThreadCollection);

      return _getState();
    });
  }
}
