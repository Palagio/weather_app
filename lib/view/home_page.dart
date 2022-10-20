import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/widgets/daily_weather_widget.dart';
import 'package:weather_app/view/widgets/hour_time.dart';
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
  bool _isLoading = true;

  @override
  void initState() {
    context.read<WeatherController>().getCurrentWeather();
    context.read<WeatherController>().getHourlyWeather();
    context.read<WeatherController>().getDailyWeather();
    _isLoading = false;
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
          double? atualTemp;

          if (controller.hourly.isNotEmpty &&
              controller.daily.isNotEmpty &&
              controller.currentWeather!.weather != null &&
              controller.currentWeather != null &&
              _isLoading == false) {
            pop = controller.hourly[0].pop;
            maxTemp = controller.daily[0].temp!.max;
            minTemp = controller.daily[0].temp!.min;
            id = controller.currentWeather?.weather![0].id;
            atualTemp = controller.currentWeather?.temp;

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
                          '${atualTemp?.round()}°',
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
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF104084),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${monthTime(
                              controller.hourly[0].dt!.toInt(),
                            )}'
                            ' , '
                            '${dayTime(controller.hourly[0].dt!.toInt())}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color(0xFF104084),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return DailyWeatherWidget(
                            temp: '${controller.hourly[index].temp?.round()}',
                            id: controller.hourly[index].weather?[0].id,
                            utc: controller.hourly[index].dt!.toInt(),
                          );
                        },
                      )),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
