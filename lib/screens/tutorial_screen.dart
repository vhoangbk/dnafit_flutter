import 'dart:ffi';

import 'package:dnafit_flutter/widgets/CirularIcon.dart';
import 'package:dnafit_flutter/widgets/counter_widget.dart';
import 'package:dnafit_flutter/widgets/dot.dart';
import 'package:dnafit_flutter/widgets/tutorial_widget.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TutorialState();
  }

}

class TutorialState extends State<TutorialScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300,
              child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (value){
                    print(value);
                  },
                  itemBuilder: (context, position){
                    return Container(
                      color: position % 2 == 0 ? Colors.pink : Colors.cyan,
                      child: Center(
                          child: Text('postion $position')
                      ),
                    );
                  }
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.green,
              height: 30,
              child: Row(
                children: [
                  Text('data')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}