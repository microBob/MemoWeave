import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/models/block_collection.dart';
import 'package:memoweave/models/thread_collection.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/viewmodels/thread_viewmodel.dart';
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
        body: const SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.all(24),
            child: ThreadView(
              threadId: 3,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => ref.invalidate(threadViewModelProvider),
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              onPressed: () async {
                final databaseManager =
                    await ref.read(databaseManagerProvider.future);
                final newThread =
                    ThreadCollection(id: 3, dateTime: DateTime.now(), blocks: {
                  BlockCollection(
                    children: {
                      BlockCollection(),
                      BlockCollection(),
                    },
                  ),
                  BlockCollection(),
                  BlockCollection(),
                });
                databaseManager.putThreadCollection(newThread);
              },
              child: const Icon(Icons.create),
            ),
          ],
        ),
      ),
    );
  }
}
