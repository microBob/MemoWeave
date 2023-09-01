import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
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
    required final Id threadId,
    required final DatabaseManager databaseManager,
    required final TextEditingController spoolTextEditingController,
  }) {
    // Set initial spool.
    spoolTextEditingController.text = state.threadCollection.spool;

    // Add listener to spool changes.
    spoolTextEditingController.addListener(spoolSelectionChanged);

    // Return state.
    return T;
  }

  Future<ThreadState> _getState() async {
    final databaseManager = await ref.read(databaseManagerProvider.future);
    final threadCollection =
        await databaseManager.getThreadCollectionById(threadId);
    if (threadCollection == null) {
      throw FileSystemException('Thread with ID ${threadId} does not exist!');
    }

    return ThreadState(
        threadCollection: threadCollection, cursorRect: Rect.zero);
  }

  /// Construct or retrieve the data for a Thread.

  List<DropdownMenuEntry> setToMenuEntries(Set set) {
    return set
        .map((element) => DropdownMenuEntry(value: element, label: element))
        .toList();
  }

  void spoolSelectionChanged() {
    // Create new Thread.
    final newThreadCollection =
        state.threadCollection.copyWith(spool: spoolTextEditingController.text);

    state = await AsyncValue.guard(() async {
      final currentState = await _getState();

      // Write to database.
      final databaseManager = await ref.read(databaseManagerProvider.future);
      databaseManager.putThreadCollection(newThreadCollection);

      // Prompt spools list to recompute.
      ref.invalidate(spoolsProvider);

      // Return state on completion.
      return _getState();
    });
  }

  Future<void> subjectChanged(String newSubject) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        final currentState = await _getState();

        // Create new Thread
        final newThreadCollection =
            currentState.threadCollection.copyWith(subject: newSubject);

        // Write to database
        final databaseManager = await ref.read(databaseManagerProvider.future);
        databaseManager.putThreadCollection(newThreadCollection);

        return _getState();
      },
    );
  }

  KeyEventResult handleEditorTraversal(FocusNode focusNode, KeyEvent keyEvent) {
    if (keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent) {
      switch (keyEvent.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          focusNode.nextFocus();
        case LogicalKeyboardKey.arrowUp:
          focusNode.previousFocus();
        case LogicalKeyboardKey.enter:
          ref.invalidateSelf();
        default:
          return KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
