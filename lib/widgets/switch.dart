import 'package:flutter/material.dart';

class Switch extends StatefulWidget {

  const Switch({super.key});

  @override
  State<Switch> createState() => SwitchState();
}

class SwitchState extends State<Switch> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: Image.asset(''),
    );
  }
}
