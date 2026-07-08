import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
import '../todo.dart';

class TodoFormDialog extends StatefulWidget {
  final Todo? existingTodo;
  final Function(Todo) onSubmit;

  const TodoFormDialog({
    super.key,
    this.existingTodo,
    required this.onSubmit,
  });

  @override
  State<TodoFormDialog> createState() => _TodoFormDialogState();
}

class _TodoFormDialogState extends State<TodoFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  // final _uuid = Uuid();

  @override
  void initState() {
    super.initState();
    // Pre-fill controllers if updating an existing task
    _titleController = TextEditingController(text: widget.existingTodo?.title ?? '');
    _descController = TextEditingController(text: widget.existingTodo?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final submittedTodo = Todo(
        // Use existing ID if updating, generate new one if creating
        id: widget.existingTodo?.id ?? DateTime.now().toString(),
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        isCompleted: widget.existingTodo?.isCompleted ?? false,
      );
      
      widget.onSubmit(submittedTodo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingTodo != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Task' : 'New Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) => 
                  value == null || value.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description (Optional)'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Update' : 'Add'),
        ),
      ],
    );
  }
}