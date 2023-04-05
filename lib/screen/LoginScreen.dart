import 'package:dnafit_flutter/screen/HomeScreen.dart';
import 'package:dnafit_flutter/widgets/CountDown.dart';
import 'package:dnafit_flutter/widgets/Greeting.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  _onPresClickMe() {
    Navigator.pushNamed(context, "/home");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Greeting(name: "Hello"),
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              width: 50,
              height: 50,
            ),
            TextButton(onPressed: _onPresClickMe, child: Text('Login')),
            const CountDown()
          ],
        ),
      ),
    );
  }
}
