import 'package:dnafit_flutter/widgets/count_down.dart';
import 'package:dnafit_flutter/widgets/greeting.dart';
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
      body: Stack(
        children: [
          Container(
            color: const Color(0xffbbddf1),
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xaa4B165E),
            child: Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Column(
                  children: const [
                    Text(
                      'DNAfit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontFamily: 'oslosans-bold'
                      ),
                    ),TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          hintText: 'Enter a search term',
                        ),
                      ),
                  ], 
                )
              )
            ]),
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const Greeting(name: "Hello"),
          //     Image.asset(
          //       'assets/images/logo.png',
          //       fit: BoxFit.contain,
          //       width: 50,
          //       height: 50,
          //     ),
          //     TextButton(onPressed: _onPresClickMe, child: Text('Login')),
          //     const CountDown()
          //   ],
          // ),

        ],
      ),
    );
  }
}
