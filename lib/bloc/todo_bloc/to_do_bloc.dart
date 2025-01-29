import 'package:bloc_learning/bloc/todo_bloc/to_do_event.dart';
import 'package:bloc_learning/bloc/todo_bloc/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvents, ToDoState> {
  final List<String> todosList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddTodoEvent>(_todoTask);
    on<RemoveTodoEvent>(_todoRemove);
  }
  void _todoTask(AddTodoEvent events, Emitter<ToDoState> emit) {
    todosList.add(events.task);
    emit(
      state.copyWith(
        todosList: List.from(todosList),
      ),
    );
  }

  void _todoRemove(RemoveTodoEvent events, Emitter<ToDoState> emit) {
    todosList.remove(events.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
