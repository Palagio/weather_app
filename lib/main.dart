import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/repository.dart';

void main() {
  final repository = Repository();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => WeatherController(repository)),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
