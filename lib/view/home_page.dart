import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/widgets/daily_weather_widget.dart';
import 'package:weather_app/view/widgets/icon_text_widget.dart';
import 'package:provider/provider.dart';
import '../lottie_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String image = '';

  @override
  void initState() {
    context.read<WeatherController>().getCurrentWeather();
    context.read<WeatherController>().getHourlyWeather();
    context.read<WeatherController>().getDailyWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29B2DD),
      body: Consumer<WeatherController>(
        builder: (
          i,
          controller,
          snapshot,
        ) {
          num? pop = 5;
          num? maxTemp = 0;
          num? minTemp = 0;
          int? id;

          if (controller.hourly.isNotEmpty) {
            pop = controller.hourly[0].pop;
          }
          if (controller.daily.isNotEmpty) {
            maxTemp = controller.daily[0].temp!.max;
            minTemp = controller.daily[0].temp!.min;
          }
          if (controller.currentWeather!.weather != null) {
            id = controller.currentWeather?.weather![0].id;
          }

          return SafeArea(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 220,
                    height: 220,
                    child: Lottie.asset(
                      setLottieImage(id),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        '${controller.currentWeather?.temp?.round()}°',
                        style: const TextStyle(
                          fontSize: 64,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Precipitations',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Max.: ${maxTemp!.round()}°',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Min.: ${minTemp!.round()}°',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .85,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF104084),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconTextWidget(
                              icon: Icons.abc,
                              text: '${controller.currentWeather?.humidity}%',
                            ),
                            IconTextWidget(
                              icon: Icons.abc,
                              text: '${(pop! * 100).round()}%',
                            ),
                            IconTextWidget(
                              icon: Icons.abc,
                              text:
                                  '${controller.currentWeather?.windSpeed?.round()} km/h',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF104084),
                  ),
                  child: DailyWeatherWidget(
                    temp: '20',
                    icon: Icons.abc,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
