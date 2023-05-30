import 'package:dnafit_flutter/widgets/tutorial_widget.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<CounterWidget>{

  @override
  Widget build(BuildContext context) {

    final TutorialWidget? tutorialWidget = TutorialWidget.of(context);

    // TODO: implement build
    return Container(
      child: Center(
        child: Text('loading: ${tutorialWidget?.loading}'),
      ),
    );
  }

}