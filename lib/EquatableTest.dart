import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

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

        // In Dart one object is not equal to other object by default. That's why when we compare the
        // person to person1 it says "false" even if the values of the object are same, because their
        // hashcodes are different.

        Person person = Person(name: "Nouman", age: 30);
        Person person1 = Person(name: "Nouman", age: 30);

        print(person == person1);

        print(person.hashCode.toString());
        print(person1.hashCode.toString());


        // This code is to check with the equatable package
        Car car = Car(name: "Tata", model: 2024);
        Car car1 = Car(name: "Tata", model: 2024);

        print(car == car1);

        print(car.hashCode.toString());
        print(car1.hashCode.toString());

      }),
    );
  }
}

class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  // Normally if we want to compare the object we have to override the == operator as well as hashcode.
  // this code is to check and compare the objects is same or not

  // If we run the app with along this code we will get true and same hashcode if the values are same.

  // Overriding the == operator is a lengthy and very tedious process as we have to write extra code for this.
  // So to avoid this tedious process we use Equatable package

  @override
  operator == (Object other) {
    return identical(this, other) ||
    other is Person && runtimeType == other.runtimeType &&
    name == other.name &&
    age == other.age;
  }

  // this code is to check the hashcode is same or not
  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}



// This is the class with equatable package
class Car extends Equatable{
  final String name;
  final int model;

  const Car({required this.name, required this.model});

  @override
  List<Object?> get props => [name, model];

}


