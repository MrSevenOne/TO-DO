import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/time_pick/picktime_state.dart';
import 'package:todo_app/ui/widget/date/pick/time/time_pick.dart';
import '../../../bloc/day_pick/daypick_state.dart';
import '../../../bloc/time_pick/picktime_bloc.dart';
import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';
import '../../../model/todo_model.dart';
import '../date/pick/day/day_pick.dart';

void showAddItemDialog(BuildContext context) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final time = context.read<TimepickState>().selectedTime;
  final day = context.read<DaypickState>().selectedDay;

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("time: ${time.format(context)}"),
                Spacer(),
                TimePickWidget(),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("day: $day"),
                Spacer(),
                DatePickWidget(),
              ],
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
                day: context
                        .read<TimePickBloc>()
                        .state
                        .selectedTime
                        ?.format(context)
                        .toString() ??
                    "No time selected",
                time: "",
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
