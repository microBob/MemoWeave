import 'package:flutter/material.dart';
import 'package:memoweave/models/database_props.dart';
import 'package:memoweave/models/thread_collection.dart';

class ThreadState {
  final DatabaseProps databaseProps;
  final TextEditingController spoolTextEditingController;
  final ThreadCollection threadCollection;
  final Rect cursorRect;

  ThreadState({
    required this.databaseProps,
    required this.spoolTextEditingController,
    required this.threadCollection,
    required this.cursorRect,
  });
}
