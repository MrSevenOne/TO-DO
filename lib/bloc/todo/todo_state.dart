import 'package:todo_app/model/todo_model.dart';

abstract class TodoState {}

class LoadingTodoState extends TodoState {}

class LoadedTodoState extends TodoState {
  final List<TodoModel> todoList;

  LoadedTodoState(this.todoList);
}


class ErrorTodoState extends TodoState {
  final String errorMassage;

  ErrorTodoState(this.errorMassage);
}
