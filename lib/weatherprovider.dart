
import 'package:flutter/material.dart';
import 'package:newpro/weathermodel.dart';
import 'package:newpro/weatherservice.dart';

class WeatherProvider with ChangeNotifier {
              final _weatherservice = Weatherservice();
  Weather? weather;
  bool isLoading = false;

  Future<void> fetchweather(String city) async {
    isLoading = true;
                notifyListeners();
    try {
      weather = await _weatherservice.fetchWeather(city);
      
               } catch (err) {
      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
