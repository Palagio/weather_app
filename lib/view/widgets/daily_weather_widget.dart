import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/helpers/lottie_switch.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(
      {super.key, this.day, this.id, this.maxTemp, this.minTemp});

  final String? day;
  final int? id;
  final num? maxTemp;
  final num? minTemp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '$day',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: Lottie.asset(
                setLottieImage(id),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${maxTemp!.round()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Text(
                      '°C',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                  TextSpan(
                      text: ' ${minTemp!.round()}',
                      style: const TextStyle(color: Colors.grey)),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Text(
                      '°C',
                      style: TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                  ),
                ]),
              )),
        ],
      ),
    );
  }
}
