import 'package:flutter/material.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          body: Stack(
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
                    TextInput(
                      hintText: 'USERNAME OR EMAIL',
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),
                    TextInput(
                      hintText: 'PASSWORD',
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFFF36E2E)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(200, 45)),
                      ),
                      onPressed: () {},
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
          ),
        )
      ],
    );
  }
}
