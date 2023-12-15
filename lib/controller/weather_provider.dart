import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_api.dart';
import '../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  Weather? data;

  Future<Weather?> getData(String place) async {
    isLoading = true;
    notifyListeners();

    data = await WeatherApiClient().getCurrentWeather(place);

    isLoading = false;
    notifyListeners();

    return data;
  }

  void getdata() {
    data = null;
    notifyListeners();
  }
}
