import 'package:flutter/material.dart';
import '../todo.dart';
import '../widgets/todo_item_widget.dart';
import '../widgets/todo_form_dialog.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // READ: The state list holding all our tasks
  final List<Todo> _todos = [];

  // CREATE
  void _addTodo(Todo todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  // UPDATE
  void _updateTodo(Todo updatedTodo) {
    setState(() {
      final index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
      if (index != -1) {
        _todos[index] = updatedTodo;
      }
    });
  }

  // DELETE
  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  // UPDATE (Toggle Status)
  void _toggleStatus(String id, bool? value) {
    setState(() {
      final todo = _todos.firstWhere((todo) => todo.id == id);
      todo.isCompleted = value ?? false;
    });
  }

  void _showFormDialog([Todo? existingTodo]) {
    showDialog(
      context: context,
      builder: (context) => TodoFormDialog(
        existingTodo: existingTodo,
        onSubmit: (todo) {
          if (existingTodo == null) {
            _addTodo(todo);
          } else {
            _updateTodo(todo);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects & Tasks'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // READ: Displaying the data
      body: _todos.isEmpty
          ? const Center(child: Text('No tasks yet. Add one!'))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  todo: _todos[index],
                  onToggle: (value) => _toggleStatus(_todos[index].id, value),
                  onEdit: () => _showFormDialog(_todos[index]),
                  onDelete: () => _deleteTodo(_todos[index].id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDialog(), // Triggers Create
        child: const Icon(Icons.add),
      ),
    );
  }
}