import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/constant/secret.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather?> getCurrentWeather(String? location) async {
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apikey&units=metric");

      var response = await http.get(endpoint);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return Weather.fromJson(body);
      } else {
        // Handle non-200 status code
        print("Error: ${response.statusCode}");
        return null; // Or throw an exception if you want to propagate the error
      }
    } catch (e) {
      // Handle other exceptions, such as network errors
      print("Exception: $e");
      return null; // Or throw an exception if you want to propagate the error
    }
  }
}
