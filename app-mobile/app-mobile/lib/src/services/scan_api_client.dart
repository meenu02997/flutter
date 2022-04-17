import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constant.dart';

class ScanApiClient {
  Future<Map<String, dynamic>> refundBoxApi(Map<String, String> body, String apiKey) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ilunch:FK4dcEPt0!V'));
    print(basicAuth);
    var request = http.MultipartRequest(
      'POST', Uri.parse(Constant.baseurl+'/pwaapi/refunduserbox?apikey=$apiKey'),
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
    print("request: "+request.toString());
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode != null && response.statusCode != 200) {
      Map<String, dynamic> error = jsonDecode(response.body);
      throw error;
    }
    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }
  Future<Map<String, dynamic>> getBoxCount(Map<String, String> body, String apiKey) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ilunch:FK4dcEPt0!V'));
    print(basicAuth);
    var request = http.MultipartRequest(
      'POST', Uri.parse(Constant.baseurl+'/pwaapi/getuser?apikey=$apiKey'),
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
    print("request: "+request.toString());
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode != null && response.statusCode != 200) {
      Map<String, dynamic> error = jsonDecode(response.body);
      throw error;
    }
    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }
}