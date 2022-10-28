import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/widgets/daily_weather_widget.dart';
import 'package:weather_app/view/widgets/hourly_weather_widget.dart';
import 'package:weather_app/helpers/time_convert_helper.dart';
import 'package:weather_app/view/widgets/icon_text_widget.dart';
import 'package:provider/provider.dart';
import '../helpers/lottie_switch.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) => getData());
    super.initState();
  }

  getData() async {
    var weather = Provider.of<WeatherController>(context, listen: false);
    await weather.getCurrentWeather();
    await weather.getHourlyWeather();
    await weather.getDailyWeather();
    _isLoading = false;
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
          if (_isLoading == false) {
            num? pop = controller.hourly[0].pop;
            num? maxTemp = controller.daily[0].temp!.max;
            num? minTemp = controller.daily[0].temp!.min;
            int? id = controller.currentWeather.weather![0].id;
            double? atualTemp = controller.currentWeather.temp;

            return SafeArea(
              child: SingleChildScrollView(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconTextWidget(
                                  image: 'assets/images/icons/rain_ping.png',
                                  text: '${(pop! * 100).round()}%',
                                ),
                                IconTextWidget(
                                  image: 'assets/images/icons/humidity.png',
                                  text:
                                      '${controller.currentWeather.humidity}%',
                                ),
                                IconTextWidget(
                                  image: 'assets/images/icons/wind.png',
                                  text:
                                      '${controller.currentWeather.windSpeed?.round()} km/h',
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
                      height: 50,
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
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          return HourlyWeatherWidget(
                            temp: '${controller.hourly[index].temp?.round()}',
                            id: controller.hourly[index].weather?[0].id,
                            utc: controller.hourly[index].dt!.toInt(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color(0xFF104084),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Next Forecast',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 24,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: 330,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color(0xFF104084),
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.daily.length,
                        itemBuilder: (context, index) {
                          return DailyWeatherWidget(
                            maxTemp: controller.daily[index].temp!.max,
                            minTemp: controller.daily[index].temp!.min,
                            id: controller.daily[index].weather![0].id,
                            day: dayOfWeek(
                              controller.daily[index].dt!.toInt(),
                            ).toString(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
