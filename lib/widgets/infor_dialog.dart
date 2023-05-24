import 'package:dnafit_flutter/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class InforDialog extends StatelessWidget {
  String message;

  InforDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return (Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ButtonPrimary(
              text: 'Close',
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ));
  }
}
