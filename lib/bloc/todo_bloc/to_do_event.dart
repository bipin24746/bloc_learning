import 'package:equatable/equatable.dart';

abstract class ToDoEvents extends Equatable{
  const ToDoEvents();
}
class AddTodoEvent extends ToDoEvents{
  final String task;
  const AddTodoEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}
class RemoveTodoEvent extends ToDoEvents{

  final Object task;
  const RemoveTodoEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}