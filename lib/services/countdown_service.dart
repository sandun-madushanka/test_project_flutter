import 'package:testflutter/utils/api_config.dart';

///in here define home screen required api calls
class CountdownServices {
  Future<Map<String, dynamic>> getCountdown() async {
    final response = await ApiServices().getApiMok.getCountdown();
    return response.data!;
  }
}
