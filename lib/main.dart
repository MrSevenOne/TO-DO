import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:todo_app/test.dart';
import 'package:todo_app/ui/home/homepage.dart';

import 'bloc/pickdate/pickdate_bloc.dart';
import 'bloc/todo/todo_bloc.dart';
import 'bloc/todo/todo_event.dart';
import 'data/database_helper.dart';
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc(DataBaseHelper.instance)..add(LoadTodoEvent())),
        BlocProvider(create: (_) => DatePickerBloc()), // DatePickerBloc
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
