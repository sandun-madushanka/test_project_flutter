import 'package:flutter/cupertino.dart';

import '../services/countdown_service.dart';

class CountdownProvider with ChangeNotifier {
  ///private variables
  bool _isLoading = true;
  final CountdownServices _countdownServices = CountdownServices();

  ///getter & setter

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  ///getter & setter

  ///this will call when app is opening
  CountdownProvider.initialize() {}

  ///By calling this method cann retrieve the countdown
  Future<int> getCountdownValue() async {
    int time = 0;
    try {
      isLoading = true;
      // notifyListeners();
      Map<String, dynamic> response = await _countdownServices.getCountdown();
      time = response["time"];
      isLoading = false;
      // notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
    return time;
  }
}
