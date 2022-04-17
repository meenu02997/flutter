/*import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'Model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_client.g.dart';

class Apis{
  static const String user = 'ps17/ps-mobikul/api/mobikul/getproductpage?width=720&id_product=56&ws_key=PXIHTSBPK7781D2M6SB4C5IV9SRJ832Z&outputformat=json';
}

@RestApi(baseUrl: "https://prestashop.webkul.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;

  @GET(Apis.user)
  Future<List<MainClass>> getUsers();

}*/