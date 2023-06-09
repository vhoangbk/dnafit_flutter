import 'package:dnafit_flutter/models/session.dart';
import 'package:dnafit_flutter/utils/storageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'navigator/app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //
  // });
  // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
  //
  // });

  Session session = await StorageUtils().getSession();

  runApp(App(isLogin: session.sessionId.isNotEmpty));
}
