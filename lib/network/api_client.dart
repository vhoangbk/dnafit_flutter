import 'dart:convert';
import 'dart:developer';
import 'package:dnafit_flutter/widgets/infor_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/progress_dialog.dart';
import 'response.dart';

class ApiClient {

  BuildContext context;

  ApiClient(this.context);

  Map<String, String> createHeader(){
    return {
      "Content-Type": "application/json",
      "Authorization": "Basic QURNSU46QURNSU4="
    };
  }

  String createBody(Map<String, dynamic> args){
    Map<String, dynamic> params = {
      "refNo": 'PKC68714-20234221120639646',
      "deviceIdCommon": '00000000-0000-0000-0000-92e5e3834886',
      "appVersion": 'android_11.9_',
      "softTokenId":"6fcf1dd966efc35270de9e0c428a7d87d3a4369e",
      "deviceId":"00000000-0000-0000-0000-92e5e3834886",
      ...args,
    };
    return jsonEncode(params);
  }

  void onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressDialog();
      },
    );
  }

  void onError(String msg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InforDialog(message: msg);
      },
    );
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> params, bool showLoading, bool showError) async {
    String jsonParam = createBody(params);
    debugPrint('[REQUeST] $url $jsonParam');
    if (showLoading){
      onLoading();
    }
    final res = await http.post(
      Uri.parse(url),
      headers: createHeader(),
      encoding: Encoding.getByName('utf-8'),
      body: jsonParam,
    );
    if (showLoading) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
    if (res.statusCode == 200) {
      String body = res.body;
      debugPrint('[RESPONSE] $body');
      // log('[RESPONSE] $body');
      // Response response = Response.fromJson(jsonDecode(body));
      Map<String, dynamic> json = jsonDecode(body);
      String responseCode = json['result']['responseCode'];
      String message = json['result']['message'];
      if (responseCode != '00' && showError) {
        onError(message);
      }
      return json;
    } else {
      onError('error server or internet ${res.statusCode}');
      throw Exception('error server or internet ${res.statusCode}');
    }
  }

}