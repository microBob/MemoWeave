import 'package:flutter/material.dart';
import 'package:memoweave/widgets/block.dart';

void main() {
  runApp(const MemoWeave());
}

class MemoWeave extends StatelessWidget {
  const MemoWeave({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: const [
            Block(),
            Block(),
          ],
        ),
      ),
    );
  }
}
