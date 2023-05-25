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
      future: StorageUtils().hasLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool?> hasLogin){
          if (hasLogin.hasData) {
            FlutterNativeSplash.remove();
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Session())
            ],
            child:
                MaterialApp(
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: isLogin ? '/test' : '/test',
                  onGenerateRoute: (setting) {
                    return initRouter(setting);
                  },
                ),
          );
        }
    );
  }
}
