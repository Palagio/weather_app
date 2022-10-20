import 'package:flutter/cupertino.dart';

class DailyWeatherWidget extends StatelessWidget {
  final int hour = DateTime.now().hour;
  final String? temp;
  final Icon? icon;

  DailyWeatherWidget({super.key, this.icon, this.temp});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
