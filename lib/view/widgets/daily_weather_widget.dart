import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyWeatherWidget extends StatelessWidget {
  final int hour = DateTime.now().hour;
  final String? temp;
  final IconData? icon;

  DailyWeatherWidget({super.key, this.icon, this.temp});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 40,
        top: 40,
        child: SizedBox(
          child: Text(
            '$temp°C',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Positioned(
        left: 40,
        top: 80,
        child: SizedBox(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        left: 40,
        top: 140,
        child: SizedBox(
          child: Text(
            '${hour.toString()}.00',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}
