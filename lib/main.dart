import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      home: ref.watch(databaseManagerProvider).when(
            data: (databaseManager) => Scaffold(
              appBar: AppBar(
                title: const Text('MemoWeave'),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  minimum: const EdgeInsets.all(24),
                  child: ThreadView(
                    databaseProps: (id: 3, databaseManager: databaseManager),
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
                    onPressed: () {
                      final newThread =
                          ThreadCollection(dateTime: DateTime.now());
                      databaseManager.putThreadCollection(newThread);
                    },
                    child: const Icon(Icons.create),
                  ),
                ],
              ),
            ),
            error: (error, stackFrame) => Text('$stackFrame: $error'),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
