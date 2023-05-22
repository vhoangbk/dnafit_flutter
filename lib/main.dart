import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'navigator/app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
;
  });
  WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {

  });

  runApp(App());
}
