import 'package:flutter/material.dart';
import 'package:memoweave/models/thread_collection.dart';

class ThreadState {
  final ThreadCollection threadCollection;
  final Rect cursorRect;
  final TextSelection cursorExtentOffset;

  ThreadState({
    required this.threadCollection,
    required this.cursorRect,
    required this.cursorExtentOffset,
  });

  ThreadState copyWith({
    ThreadCollection? threadCollection,
    Rect? cursorRect,
    TextSelection? cursorExtentOffset,
  }) {
    return ThreadState(
      threadCollection: threadCollection ?? this.threadCollection,
      cursorRect: cursorRect ?? this.cursorRect,
      cursorExtentOffset: cursorExtentOffset ?? this.cursorExtentOffset,
    );
  }
}
