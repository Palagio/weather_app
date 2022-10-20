import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/lottie_switch.dart';

class DailyWeatherWidget extends StatelessWidget {
  final String? temp;
  final int? id;
  final int utc;

  const DailyWeatherWidget({super.key, this.id, this.temp, required this.utc});

  hourTime() {
    final localTime = DateTime.fromMillisecondsSinceEpoch(utc * 1000).hour;

    return localTime;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$temp°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Lottie.asset(
              setLottieImage(id),
            ),
            Text(
              '${hourTime()}:00',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
