import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_counter_app/api.dart';
import 'package:weather_counter_app/schemas.dart';
import 'package:weather_counter_app/utils/helper_utils/alerts.dart';
import 'package:weather_counter_app/utils/helper_utils/functions.dart';

class WeatherNotifier with ChangeNotifier {
  WeatherData? _data;
  WeatherData? get data => _data;

  void saveWeatherData(WeatherData data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "weather",
      jsonEncode(data),
    );
  }

  Future<void> restoreWeatherData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      // Try to restore values from saved data
      final String? weatherDataAsString = prefs.getString('weather');
      if (weatherDataAsString != null) {
        Map<String, dynamic> weatherDataAsMap = jsonDecode(weatherDataAsString);
        _data = WeatherData.fromJson(weatherDataAsMap);
        updateValues();
      } else {
        // fetch data from server if data is not saved and if connected to network
        if (await isNetworkAvailable()) {
          await fetchWeatherData();
        } else {
          showToast(
            "Couldnt fetch weather data because you are not connected to any network",
          );
        }
      }
    } catch (e) {
      debugPrint("Error caught in restoreWeatherData() notifier fn => $e");
    }
  }

  Future<void> fetchWeatherData() async {
    try {
      WeatherResponse? response = await MyApis.fetchWeatherData();
      if (response != null) {
        _data = response.data;
        saveWeatherData(_data!);
        updateValues();
      }
    } catch (e) {
      debugPrint("Error caught in fetchWeatherData() notifier fn => $e");
    }
  }

  void updateValues() => notifyListeners();
}
