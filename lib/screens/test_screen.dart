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
              TextField(
                onChanged: (value){
                  // print(value);
                },
                controller: textEditingController,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  labelText: 'input username or email',
                  hintText: 'USERNAME OR EMAIL',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'PASSWORD',
                  fillColor: Colors.amberAccent,
                  focusColor: Colors.green,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                  onPressed: () {
                    // ApiClient client = ApiClient();
                    // Response res = await client.post('/retail-micms/listCrossSelling');
                    // String res = client.createBody({
                    //   'name': 'hoangnv',
                    //   'age': 18,
                    // });
                    // print(res);

                    textEditingController.text = '';

                  },
                  child: Text('Click me')
              )
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
