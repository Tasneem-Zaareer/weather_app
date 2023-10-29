import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/splash_screen/presentation/views/splash_view.dart';
import 'features/home/presentation/manager/weather_cubit/weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getDefaultWeather(),
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: SplashView(),
      ),
    );
  }
}
