import 'package:dnafit_flutter/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class InforDialog extends StatelessWidget{

  String message;

  InforDialog({super.key, required this.message});

    @override
    Widget build(BuildContext context) {
    return (
      Dialog(
        backgroundColor: Colors.transparent,

          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('dfjad')
                  ],
                ),

              ),
            ),
        ),
      )
    );
  }
}