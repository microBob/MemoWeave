import 'package:flutter/material.dart';
import 'package:memoweave/models/thread_collection.dart';

class ThreadState {
  final ThreadCollection threadCollection;
  final Rect cursorRect;

  ThreadState({required this.threadCollection, required this.cursorRect});
}
