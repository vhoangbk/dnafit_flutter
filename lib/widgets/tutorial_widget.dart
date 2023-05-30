import 'package:flutter/material.dart';

class TutorialWidget extends InheritedWidget {

  final bool loading;

  const TutorialWidget({super.key, required super.child, required this.loading});

  static TutorialWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<TutorialWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

}