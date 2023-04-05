import 'package:dnafit_flutter/screen/HomeScreen.dart';
import 'package:dnafit_flutter/screen/LoginScreen.dart';
import 'package:flutter/material.dart';

initRouter(RouteSettings setting) {
  final screen;
  switch (setting.name) {
    case "/home":
      screen =
          MaterialPageRoute(builder: (_) => const HomeScreen(title: "Home"));
      break;
    case "/login":
      screen = MaterialPageRoute(builder: (_) => const LoginScreen());
      break;
    default:
      screen = MaterialPageRoute(builder: (_) => const LoginScreen());
      break;
  }
  return screen;
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const HomeScreen(title: "Home"),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
