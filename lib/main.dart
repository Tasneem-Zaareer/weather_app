import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';
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
      child: const MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: HomeView(),
      ),
    );
  }
}
