import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/helpers/lottie_switch.dart';

import '../../helpers/time_convert_helper.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final String? temp;
  final int? id;
  final int utc;

  const HourlyWeatherWidget({super.key, this.id, this.temp, required this.utc});

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
              '${hourTime(utc)}:00',
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
