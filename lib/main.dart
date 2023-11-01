import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/functions.dart';
import 'package:weather_app/features/splash_screen/presentation/views/splash_view.dart';
import 'features/home/presentation/manager/weather_cubit/weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

      return BlocProvider(
        create: (context) => WeatherCubit()..getWeather(cityName: 'Japan'),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const SplashView(),
        ),
      );

  }
}
