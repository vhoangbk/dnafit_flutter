import 'package:dnafit_flutter/network/api_client.dart';
import 'package:dnafit_flutter/network/response.dart';
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
                ApiClient client = ApiClient();
                Response res = await client.post('/retail-micms/listCrossSelling');
                print(res.toJson());
              },
              child: Text('Click me')
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
