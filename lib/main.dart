import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_learning/bloc/todo_bloc/to_do_bloc.dart';
import 'package:bloc_learning/ui/counter/counter_screen.dart';
import 'package:bloc_learning/ui/switch/switch_example_screen.dart';
import 'package:bloc_learning/ui/todo/to_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SwitchBloc()), // Provide SwitchBloc
          BlocProvider(create: (_) => CounterBloc()), // Provide CounterBloc
          BlocProvider(create: (_) => ToDoBloc())
        ],
        child:
            ToDoApp(), // You can switch between this and CounterScreen
      ),
    );
  }
}
