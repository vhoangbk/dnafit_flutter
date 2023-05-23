import 'package:dnafit_flutter/network/api_client.dart';
import 'package:dnafit_flutter/network/endpoint.dart';
import 'package:dnafit_flutter/network/response.dart';

class LoginService extends ApiClient{
  LoginService(super.context);

  Future<Response> login(String userName, String password) async {
    Response res = await post('${EndPoint.URL_APP2}/common/doLogin', {
      "userId": userName,
      "password": password,
    }, true, true);
    return res;
  }
}