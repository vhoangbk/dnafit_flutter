import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'router.dart';

class App extends StatelessWidget {
  App({super.key}) {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/test',
      onGenerateRoute: (setting) {
        return initRouter(setting);
      },
    );
  }
}
