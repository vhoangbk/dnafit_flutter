import 'package:flutter/material.dart';

class Session extends ChangeNotifier{
  String _sessionId = '';

  String get sessionId => _sessionId;

  set sessionId(String newSessionId){
    _sessionId = newSessionId;
    notifyListeners();
  }
}