import 'package:memoweave/models/thread_collection.dart';

class ThreadState {
  final ThreadCollection threadCollection;

  ThreadState({required this.threadCollection});

  ThreadState copyWith({
    ThreadCollection? threadCollection,
  }) {
    return ThreadState(
        threadCollection: threadCollection ?? this.threadCollection.copyWith());
  }
}
