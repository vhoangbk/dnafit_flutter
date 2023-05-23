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
        child: Center(
          child: TextButton(
              onPressed: () async {
                // ApiClient client = ApiClient();
                // Response res = await client.post('/retail-micms/listCrossSelling');
                // String res = client.createBody({
                //   'name': 'hoangnv',
                //   'age': 18,
                // });
                // print(res);
              },
              child: Text('Click me')
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
