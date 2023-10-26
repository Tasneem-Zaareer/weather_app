import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/services/weather_services.dart';

import '../../data/weather_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //get city
  final String cityName = 'London';

  // weather object
  Weather? weather;

  // final currentWeather = WeatherServices(Dio()).getCurrentWeather('London');
   getWeather() async {
    Weather w =
        await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
    print(w.weatherCondition);
    setState(() {
      weather = w;
    });

    // return w;
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cloudy.png',
              height: 200,
            ),
            Text(
              'City Name',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              cityName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              weather?.weatherCondition ?? 'Loading..',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text('${weather?.temperature.round().toString()}C',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
