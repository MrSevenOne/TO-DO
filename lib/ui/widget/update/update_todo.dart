import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';

void showUpdateItemDialog(BuildContext context, TodoModel todoModel) {
  final titleController = TextEditingController(text: todoModel.title);
  final descriptionController = TextEditingController(text: todoModel.description);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Update Todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedTodo = TodoModel(
              id: todoModel.id,
              title: titleController.text,
              description: descriptionController.text,
              isCompleted: todoModel.isCompleted,
              day: todoModel.day,
              time: ''
            );
            context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));
            Navigator.pop(context);
          },
          child: Text("Update"),
        ),
      ],
    ),
  );
}
