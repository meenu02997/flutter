import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constant.dart';

class AuthApiClient {
  Future<Map<String, dynamic>> login(Map<String, String> body) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ilunch:FK4dcEPt0!V'));
    print(basicAuth);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(Constant.baseurl + '/pwa/login'),
    );
    Map<String, String> headers;
    if (Constant.baseurl == 'https://inte.ilunch.fr') {
      headers = {
        "Authorization": basicAuth,
        "Content-type": "multipart/form-data"
      };
    } else {
      headers = {
        "Content-type": "multipart/form-data"
      };
    }
    request.headers.addAll(headers);
    request.fields.addAll(body);
    print("request: " + request.toString());
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    if (response.statusCode != null && response.statusCode != 200) {
      throw new Exception('Error in login');
    }
    print(response.body);
    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }
}
