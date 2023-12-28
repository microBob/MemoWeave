import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart';

import 'models/database_props.dart';
import 'views/thread_view.dart';

void main() {
  runApp(const ProviderScope(child: MemoWeave()));

  FlutterError.demangleStackTrace = (stackTrace) {
    if (stackTrace is Trace) return stackTrace.vmTrace;
    if (stackTrace is Chain) return stackTrace.toTrace().vmTrace;
    return stackTrace;
  };
}

/// The root widget of the application.
class MemoWeave extends ConsumerWidget {
  /// Default constructor.
  const MemoWeave({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        // title: 'MemoWeave',
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
        ),
        home: ref.watch(databaseManagerProvider).when(
              data: (databaseManager) {
                final threadIds = databaseManager.threadIds;

                return Scaffold(
                  appBar: AppBar(
                    title: const Text('MemoWeave'),
                  ),
                  body: SafeArea(
                    minimum: const EdgeInsets.all(24),
                    // child: Placeholder(),
                    child: ListView.builder(
                      itemBuilder: (context, index) => ThreadView(
                        databaseProps: DatabaseProps(
                            id: threadIds[index],
                            databaseManager: databaseManager),
                      ),
                      itemCount: threadIds.length,
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: databaseManager.createNewThread,
                    child: const Icon(Icons.create),
                  ),
                );
              },
              error: (error, stackFrame) => Text('$stackFrame: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
      );
}
