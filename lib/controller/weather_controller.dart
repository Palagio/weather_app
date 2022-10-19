import 'package:flutter/cupertino.dart';
import 'package:weather_app/repository.dart';
import 'package:weather_app/weather.dart';

class WeatherController with ChangeNotifier {
  final Repository repository;
  late Current? currentWeather = Current();
  late Hourly? hourlyWeather;
  late List<Hourly> hourly = [];
  late List<Daily> daily = [];

  WeatherController(
    this.repository,
  );

  void getCurrentWeather() async {
    currentWeather = await repository.getCurrentWeather();
    notifyListeners();
  }

  void getHourlyWeather() async {
    hourly = await repository.getHourlyWeather();
    notifyListeners();
  }

  void getDailyWeather() async {
    daily = await repository.getDailyWeather();
    notifyListeners();
  }
}
