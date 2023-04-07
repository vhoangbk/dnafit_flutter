import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events

enum LoginEvent { emailChanged, passwordChanged, login }

// Define the BLoC

class LoginBloc extends Bloc {
  LoginBloc(super.initialState);

  String get initialState => "";

  @override
  Stream mapEventToState(LoginEvent event) async* {
    switch (event) {
      case LoginEvent.emailChanged:
        yield "email changed";
        break;

      case LoginEvent.passwordChanged:
        yield "password changed";
        break;

      case LoginEvent.login:
        yield "login";
        break;
    }
  }
}
