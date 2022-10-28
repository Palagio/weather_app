import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/api/repository.dart';
import 'package:weather_app/model/weather.dart';

class WeatherController with ChangeNotifier {
  final Repository repository;
  Current currentWeather = Current();
  List<Hourly> hourly = [];
  List<Daily> daily = [];

  WeatherController(
    this.repository,
  );

  Future<Current> getCurrentWeather() async {
    currentWeather = await repository.getCurrentWeather();
    notifyListeners();
    return currentWeather;
  }

  Future<List<Hourly>> getHourlyWeather() async {
    hourly = await repository.getHourlyWeather();
    notifyListeners();
    return hourly;
  }

  Future<List<Daily>> getDailyWeather() async {
    daily = await repository.getDailyWeather();
    notifyListeners();
    return daily;
  }
}
