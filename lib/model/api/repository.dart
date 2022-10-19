// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/get_location.dart';
import 'package:weather_app/model/weather.dart';

class Repository {
  Future<Current> getCurrentWeather() async {
    Position position = await getLocation();
    var lat = position.latitude;
    var lon = position.longitude;
    var apiKey = '85b0c268fed8ef2043e2129eb8921a49';
    Current currentTemp = Current();

    var url = Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=alerts&units=metric&appid=$apiKey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = const JsonDecoder().convert(response.body);

      Current currentTemp = Current.fromJson(json['current']);

      return currentTemp;
    }

    return currentTemp;
  }

  Future<List<Hourly>> getHourlyWeather() async {
    Position position = await getLocation();
    var lat = position.latitude;
    var lon = position.longitude;
    var apiKey = '85b0c268fed8ef2043e2129eb8921a49';
    List<Hourly> hourlyTemp = [];

    var url = Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=alerts&units=metric&appid=$apiKey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = const JsonDecoder().convert(response.body);

      for (var e in (json['hourly'] as List)) {
        hourlyTemp.add(Hourly.fromJson(e));
      }

      return hourlyTemp;
    }

    return hourlyTemp;
  }

  Future<List<Daily>> getDailyWeather() async {
    Position position = await getLocation();
    var lat = position.latitude;
    var lon = position.longitude;
    var apiKey = '85b0c268fed8ef2043e2129eb8921a49';
    List<Daily> dailyTemp = [];

    var url = Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=alerts&units=metric&appid=$apiKey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = const JsonDecoder().convert(response.body);

      for (var e in (json['daily'] as List)) {
        dailyTemp.add(Daily.fromJson(e));
      }

      return dailyTemp;
    }

    return dailyTemp;
  }
}
