import 'package:dnafit_flutter/network/api_client.dart';
import 'package:dnafit_flutter/network/endpoint.dart';
import 'package:dnafit_flutter/network/response.dart';

class LoginService extends ApiClient{
  LoginService(super.context);

  Future<Map<String, dynamic>> login(String userName, String password) async {
    Map<String, dynamic> res = await post('${EndPoint.URL_APP2}/common/doLogin', {
      "userId": userName,
      "password": password,
    }, true, true);
    return res;
  }
}