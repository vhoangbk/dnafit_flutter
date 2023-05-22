import 'package:flutter/material.dart';
import 'dart:developer';

class SwitchWidget extends StatefulWidget{
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() {
    return SwitchWidgetState();
  }
}

class SwitchWidgetState extends State<SwitchWidget>{

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant SwitchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return Text('Vị trí thứ --> $index');
      },
    );
  }
}