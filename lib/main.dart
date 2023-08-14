import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoweave/utils/database_handler.dart';
import 'package:memoweave/widgets/editor_widget.dart';

void main() {
  runApp(const ProviderScope(child: MemoWeave()));
}

class MemoWeave extends ConsumerWidget {
  const MemoWeave({super.key});

  void test(Element element) {
    print(element.renderObject);
    element.visitChildElements((childElement) {
      test(childElement);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseHandlerProvider);
    final GlobalKey key = GlobalKey();

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
        body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EditorWidget(),
              EditorWidget(),
              database.when(
                data: (data) => Text('Database opened: ${data.path}'),
                error: (error, stat) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
              TextField(
                key: key,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print(key.currentContext?.findRenderObject().toString());
          key.currentContext?.visitChildElements((element) {
            test(element);
          });
        }),
      ),
    );
  }
}
