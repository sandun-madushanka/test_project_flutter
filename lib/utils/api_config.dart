import 'package:dio/dio.dart' as dio;
import 'package:testflutter/network/api_service/api_service.dart';

class ApiServices {
  ApiService _apiMok = ApiService(dio.Dio());

  ApiService get getApiMok => _apiMok;

  set setApiMok(ApiService value) {
    _apiMok = value;
  }
}
