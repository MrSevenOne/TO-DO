import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo/todo_event.dart';
import 'package:todo_app/bloc/todo/todo_state.dart';
import 'package:todo_app/ui/widget/date/pick/day/day_pick.dart';
import '../../bloc/day_pick/daypick_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../widget/add/add_todo.dart';
import '../widget/date/pick/time/time_pick.dart';
import '../widget/slidable/slidable_widget.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<DayPickerBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('${state.selectedDay.toLocal()}'),
        actions: [
          const DatePickWidget(),
          const TimePickWidget(),
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
                return SlidableWidget(
                  item: item,
                  id: item.id!,
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.date),
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
          showAddItemDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
