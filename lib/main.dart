import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/views/thread_view.dart';

void main() {
  runApp(const ProviderScope(child: MemoWeave()));
}

class MemoWeave extends ConsumerWidget {
  const MemoWeave({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      // title: 'MemoWeave',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MemoWeave'),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.all(24),
          child: ThreadView(
            threadId: 3,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final databaseManager =
                await ref.read(databaseManagerProvider.future);
            final newThread = ThreadCollection(id: 3);
            databaseManager.putThreadCollection(newThread);
          },
          child: const Icon(Icons.create),
        ),
      ),
    );
  }
}
