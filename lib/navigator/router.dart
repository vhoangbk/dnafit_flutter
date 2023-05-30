import 'package:dnafit_flutter/screens/test_screen.dart';
import 'package:dnafit_flutter/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

tutorialStack(RouteSettings setting) {
  final MaterialPageRoute screen;
  switch (setting.name) {
    case "/":
      screen =
          MaterialPageRoute(builder: (_) => TutorialScreen());
      break;
    case "/tutorial":
      screen =
          MaterialPageRoute(builder: (_) => mainStack(setting));
      break;
    case "/login":
      screen = MaterialPageRoute(builder: (_) => const LoginScreen());
      break;
    default:
      screen = MaterialPageRoute(builder: (_) => TutorialScreen());
      break;
  }
  return screen;
}

loginStack(RouteSettings setting) {
  final MaterialPageRoute screen;
  switch (setting.name) {
    case "/":
      screen =
          MaterialPageRoute(builder: (_) => const LoginScreen());
      break;
    case "/home":
      screen =
          MaterialPageRoute(builder: (_) => mainStack(setting));
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

mainStack(RouteSettings setting) {
  final MaterialPageRoute screen;
  switch (setting.name) {
    case "/":
      screen =
          MaterialPageRoute(builder: (_) => const HomeScreen(title: "Home"));
      break;
    case "/home":
      screen =
          MaterialPageRoute(builder: (_) => const HomeScreen(title: "Home"));
      break;
    default:
      screen = MaterialPageRoute(builder: (_) => const HomeScreen(title: "Home"));
      break;
  }
  return screen;
}

testStack(RouteSettings setting) {
  final MaterialPageRoute screen = MaterialPageRoute(builder: (_) => const TestScreen(title: "Test"));
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
