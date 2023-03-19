import 'package:flutter/material.dart';
import 'package:weather_counter_app/http.dart';
import 'package:weather_counter_app/schemas.dart';
import 'package:weather_counter_app/secrets.dart';
import 'package:weather_counter_app/utils/helper_utils/constants.dart';
import 'package:weather_counter_app/utils/helper_utils/convertors.dart';

class MyApis {
  static String get fetchWeatherApiPath =>
      "https://api.openweathermap.org/data/2.5/weather?lat=${dubaiCoordinates.latitude}&lon=${dubaiCoordinates.longitude}&appid=$weatherAPIKey";

  static Future<WeatherResponse?> fetchWeatherData() async {
    WeatherResponse? data;
    try {
      var response = await Http.get(path: fetchWeatherApiPath).retryTask();
      debugPrint(response.toString());
      data = WeatherResponse.fromJson(response);
    } catch (e) {
      debugPrint("Error caught in fetchWeatherData() Api fn => $e");
    }
    return data;
  }
}
