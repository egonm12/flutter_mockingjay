import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hello World!'),
          actions: [
            TextButton(
              onPressed: () {
                print('popping...');
                Navigator.pop(context);
                print('popped!');
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('popping...');
        Navigator.pop(context);
        print('popped!');
      },
      child: const Icon(Icons.add),
    );
  }
}
