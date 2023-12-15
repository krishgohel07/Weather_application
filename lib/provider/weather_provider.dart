import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic> location = {};
  Map<String, dynamic> current = {};
  Map<String, dynamic> forecast = {};
  List forecastday = [];
  List<WeatherModel> forecasthour = [];

  Future<void> fetchimage() async {
    String apiKey = '8c96f58319cc4b24bb035154231312';
    String api =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=rajkot&days=10&aqi=no&alerts=no';
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> fetchmap = jsonDecode(data);
      location = fetchmap['location'];
      current = fetchmap['current'];
      forecast = fetchmap['forecast'];
      forecastday = forecast['forecastday'];
      forecasthour = forecastday
          .map((e) =>
              WeatherModel(temc: e['hour'][0]['temc'], tempf: e['hour'][0]['tempf'], windmph: e['hour'][0]['windmph']))
          .toList();
    }
    notifyListeners();
  }
}
