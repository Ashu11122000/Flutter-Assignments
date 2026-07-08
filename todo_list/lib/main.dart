import 'package:flutter/material.dart';

// Lightweight in-file placeholder for screens/todo_list_screen.dart
// to fix: Target of URI doesn't exist: 'screens/todo_list_screen.dart'.
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: const Center(
        child: Text('No todos yet.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Todo App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const TodoListScreen(),
    );
  }
}
