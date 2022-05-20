import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:testflutter/network/response/app_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.101:8000/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 60000,
      connectTimeout: 60000,
      contentType: 'application/json',
    );
    return _ApiService(dio, baseUrl: baseUrl);
  }

  ///get countdown value
  @GET('/getcountdown')
  Future<AppResponse> getCountdown();
}
