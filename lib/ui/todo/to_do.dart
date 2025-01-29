import 'package:bloc_learning/bloc/todo_bloc/to_do_bloc.dart';
import 'package:bloc_learning/bloc/todo_bloc/to_do_event.dart';
import 'package:bloc_learning/bloc/todo_bloc/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(
              child: Text("Empty"),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<ToDoBloc>()
                          .add(RemoveTodoEvent(task: state.todosList[index]));
                    },
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<String> newTasks = [];
          for (int i = 0; i < 5; i++) {
            context
                .read<ToDoBloc>()
                .add(AddTodoEvent(task: 'Task: ' + i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
