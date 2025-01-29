import 'package:bloc_learning/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_learning/bloc/counter_bloc/counter_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counterapp"),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
           return Text(state.counter.toString());
          },),

       ElevatedButton(onPressed: (){
         context.read<CounterBloc>().add(IncrementCounter());

       }, child: Text("Increment"),),
          ElevatedButton(onPressed: (){
            context.read<CounterBloc>().add(DecrementCounter());
          }, child: Text("Decrement"),),
        
        ],
      ),
    );
  }
}
