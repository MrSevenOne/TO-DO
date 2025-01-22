import 'package:todo_app/model/todo_model.dart';

abstract class TodoEvent {}

class LoadTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  AddTodoEvent(this.todoModel);
}

class UpdateTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  UpdateTodoEvent(this.todoModel);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  DeleteTodoEvent({required this.id});
}
