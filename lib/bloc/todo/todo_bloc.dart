import 'package:bloc/bloc.dart';
import '../../data/database_helper.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DataBaseHelper databaseHelper;

  TodoBloc(this.databaseHelper) : super(LoadingTodoState()) {
    on<LoadTodoEvent>(_onLoadTodo);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onLoadTodo(LoadTodoEvent event, Emitter<TodoState> emit) async {
    try {
      final items = await databaseHelper.getAllItems();
      emit(LoadedTodoState(items));
    } catch (error) {
      emit(ErrorTodoState("Error GetAll $error"));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseHelper.insertItem(event.todoModel);
      add(LoadTodoEvent());
    } catch (e) {
      emit(ErrorTodoState("Error InsertItem $e"));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseHelper.updateItem(event.todoModel);
      add(LoadTodoEvent());
    } catch (e) {
      emit(ErrorTodoState("Error UpdateItem $e"));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseHelper.deleteItem(event.id);
      add(LoadTodoEvent());
    } catch (e) {
      emit(ErrorTodoState("Error DeleteItem $e"));
    }
  }
}

