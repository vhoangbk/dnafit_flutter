import 'package:dnafit_flutter/models/session.dart';
import 'package:dnafit_flutter/utils/storageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  bool isLogin = false;

  App({super.key, required this.isLogin}) {}



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StorageUtils().getSession(),
        builder: (BuildContext context, AsyncSnapshot<Session?> session){
          if (session.hasData) {
            FlutterNativeSplash.remove();
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Session())
            ],
            child: MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: (setting) {
                // if (isLogin) {
                //   return mainStack(setting);
                // } else {
                //   return loginStack(setting);
                // }

                return tutorialStack(setting);

              },
            ),
          );
        }
    );
  }
}
