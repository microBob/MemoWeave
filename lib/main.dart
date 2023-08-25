import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: const Text('MemoWeave'),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.all(24),
          child: ThreadView(
            threadId: 3,
          ),
        ),
      ),
    );
  }
}
