import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget{

  const ProgressDialog({super.key});

    @override
    Widget build(BuildContext context) {
    return (
      const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}