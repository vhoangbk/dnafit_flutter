import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  final String name;

  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text("Hello, $name!");
  }
}
