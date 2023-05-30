import 'package:flutter/material.dart';

class Dot extends StatelessWidget {

  final double radius;
  final bool active;

  const Dot({super.key, required this.radius, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
