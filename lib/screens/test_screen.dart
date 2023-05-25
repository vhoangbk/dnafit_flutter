import 'package:dnafit_flutter/models/cross_selling.dart';
import 'package:dnafit_flutter/widgets/cross_selling_error.dart';
import 'package:dnafit_flutter/widgets/cross_selling_info.dart';
import 'package:dnafit_flutter/widgets/infor_dialog.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget{
  const TestScreen({super.key, required this.title, this.name = ''});

  final String title;
  final String name;

  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> with WidgetsBindingObserver {

  AppLifecycleState? appState;
  TextEditingController textEditingController = TextEditingController();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      appState = state;
    });
    super.didChangeAppLifecycleState(state);
  }

  void onError(String msg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InforDialog(message: msg);
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    textEditingController.addListener(() {
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CrossSellingError(
                data: CrossSelling(
                  tiedProductCode: CrossSelling.CYBER_RISK_PURCHASE,
                  amount: '100000',
                  startDate: '25/05/2023',
                  endDate: '25/11/2023',
                  interestRate: '4'
                ),
              )
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
