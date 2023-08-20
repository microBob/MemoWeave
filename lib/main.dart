import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/utils/database.dart';
import 'package:memoweave/widgets/block_widget.dart';

void main() {
  runApp(const ProviderScope(child: MemoWeave()));
}

class MemoWeave extends ConsumerWidget {
  const MemoWeave({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseInstanceProvider);

    return MaterialApp(
      title: 'MemoWeave',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: const Text('MemoWeave'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlockWidget(),
            database.when(
              data: (data) => Text('Database opened: ${data.path}'),
              error: (error, stat) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
