import 'package:flutter/material.dart';

class EquatableTest extends StatefulWidget {
  const EquatableTest({super.key});

  @override
  State<EquatableTest> createState() => _EquatableTestState();
}

class _EquatableTestState extends State<EquatableTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equatable Test"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Person person = Person(name: "Nouman", age: 30);
        Person person1 = Person(name: "Nouman", age: 30);

        print(person.hashCode.toString());
        print(person1.hashCode.toString());

        print(person == person);
        print(person == person1);

      }),
    );
  }
}

class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

}
