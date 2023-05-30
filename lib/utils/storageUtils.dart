import 'dart:core';
import 'package:dnafit_flutter/models/session.dart';
import 'package:localstorage/localstorage.dart';

class StorageUtils{

  static const String fileNameStorage  = 'localstorage_app';

  StorageUtils._privateConstructor();

  static final StorageUtils _instance = StorageUtils._privateConstructor();

  factory StorageUtils() {
    return _instance;
  }

  setStringValue(String key, String value) async {
    LocalStorage storage = LocalStorage(fileNameStorage);
    await storage.setItem(key, value);
  }

  Future<String> getStringValue(String key, [String defaultValue = '']) async {
    LocalStorage storage = LocalStorage(fileNameStorage);
    await storage.ready;
    dynamic value = await storage.getItem(key);
    return value ?? defaultValue;
  }

  Future<Session> getSession() async {
    String sessionId = await getStringValue('sessionId');
    Session session = Session();
    session.sessionId = sessionId;
    return session;
  }
}