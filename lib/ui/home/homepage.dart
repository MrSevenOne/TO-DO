import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo/todo_event.dart';
import 'package:todo_app/bloc/todo/todo_state.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/ui/widget/date/pick/date_pick.dart';
import '../../bloc/pickdate/pickdate_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../widget/intl/date/date_format.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: [
          const DatePickWidget(),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is LoadingTodoState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedTodoState) {
            if (state.todoList.isEmpty) {
              return Center(
                child: Text("data bosh"),
              );
            }
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                final item = state.todoList[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.date),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => context
                        .read<TodoBloc>()
                        .add(DeleteTodoEvent(id: item.id!)),
                  ),
                );
              },
            );
          } else if (state is ErrorTodoState) {
            print(state.errorMassage);
            return Center(child: Text(state.errorMassage));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final item = TodoModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: formatDateTime(
                    context.read<DatePickerBloc>().state.selectedDate,
                  ), // Bloc orqali tanlangan sana
                  isCompleted: true,
                );
                context.read<TodoBloc>().add(AddTodoEvent(item));
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
