import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/time_pick/picktime_bloc.dart';
import 'package:todo_app/test.dart';
import 'package:todo_app/ui/home/homepage.dart';
import 'bloc/day_pick/daypick_bloc.dart';
import 'bloc/todo/todo_bloc.dart';
import 'bloc/todo/todo_event.dart';
import 'data/database_helper.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                TodoBloc(DataBaseHelper.instance)..add(LoadTodoEvent())),
        BlocProvider(create: (_) => DayPickerBloc()),
        BlocProvider(create: (_) => TimePickBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
