import 'dart:convert';
import 'package:http/http.dart' as http;
import 'response.dart';
import 'configs.dart';
import 'error.dart';

class ApiClient {

  Future<Response> post(String url) async {
    final res = await http.post(
      Uri.parse('${Configs.BASE_URL}$url'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic QURNSU46QURNSU4="
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode({
        "refNo": 'PKC68714-20234221120639646',
        "sessionId": '0c11e645-c48f-4c85-a163-bbdd5553a510',
        "deviceIdCommon": '00000000-0000-0000-0000-92e5e3834886',
        "serviceCode": 'TOPUP',
        "appVersion": 'android_11.9_',
      }),
    );

    if (res.statusCode == 200) {
      return Response.fromJson(jsonDecode(res.body));
    } else {
      throw Exception(Error(res.statusCode, 'error server or internet'));
    }
  }

}