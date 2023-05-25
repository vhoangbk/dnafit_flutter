import 'dart:convert';

import 'package:dnafit_flutter/models/session.dart';
import 'package:dnafit_flutter/network/response.dart';
import 'package:dnafit_flutter/utils/storageUtils.dart';
import 'package:dnafit_flutter/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import '../network/login_service.dart';
import '../widgets/text_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  String username = '';
  String password = '';

  @override
  void initState() {
    // if (await StorageUtils().hasLogin()) {
    //   Navigator.of(context).popAndPushNamed('home');
    // }
    super.initState();
  }

  void onPressLogin(Session session) async {
    FocusScope.of(context).unfocus();
    LoginService loginService = LoginService(context);
    try {
      Map<String, dynamic> res = await loginService.login(username, password);
      if (res['result']['responseCode'] == '00') {
        String sessionId = res['sessionId'];
        session.sessionId = sessionId;
        StorageUtils().setStringValue('sessionId', sessionId);
        Navigator.of(context).popAndPushNamed('/home');
      }
    }catch (e){
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Consumer<Session>(
              builder: (context, session, child){
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Positioned(
                      top: 150,
                      child: Text(
                        'DNAfit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontFamily: 'oslosans-bold'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonPrimary(
                            onPress: (){
                              Navigator.of(context).popAndPushNamed('home');
                            },
                            text: 'Home',
                          ),
                          Text(session.sessionId),
                          TextInput(
                            hintText: 'USERNAME OR EMAIL',
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextInput(
                            hintText: 'PASSWORD',
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFF36E2E)),
                              minimumSize:
                              MaterialStateProperty.all(const Size(200, 45)),
                            ),
                            onPressed: () => onPressLogin(session),
                            child: const Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Forgot password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'oslosans-regular'),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            )
          )
        ],
      ),
    );
  }
}
