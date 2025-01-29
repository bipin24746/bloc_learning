import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
class EquatableLearning extends StatelessWidget {
  const EquatableLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      Person person1 = Person(name: "bipin", age: 22);
      Person person2 = Person(name: "bipin", age: 22);

      print(person1.hashCode.toString());
      print(person2.hashCode.toString());
      print(person1 == person2);
    }));
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name,age];



}
