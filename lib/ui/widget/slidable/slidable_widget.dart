import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/bloc/todo/todo_state.dart';
import 'package:todo_app/ui/widget/update/update_todo.dart';
import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';

class SlidableWidget extends StatelessWidget {
  Widget child;
  int id;
  var item;

  SlidableWidget({required this.child, required this.id, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                showUpdateItemDialog(context, item);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (context) {
                context.read<TodoBloc>().add(DeleteTodoEvent(id: id));
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: child,
      );
    });
  }
}
