import 'package:dnafit_flutter/utils/storageUtils.dart';
import 'package:flutter/material.dart';

class Session extends ChangeNotifier{
  String _sessionId = '';

  // Session(){
  //   getSessionLocal();
  // }
  //
  // getSessionLocal() async{
  //   _sessionId = await StorageUtils().getStringValue('sessionId');
  // }

  String get sessionId => _sessionId;

  set sessionId(String newSessionId){
    _sessionId = newSessionId;
    notifyListeners();
  }
}