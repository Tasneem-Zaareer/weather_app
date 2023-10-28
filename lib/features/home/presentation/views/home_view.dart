import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/presentation/views/weather_info_view.dart';

import '../manager/weather_cubit/weather_cubit.dart';
import '../manager/weather_cubit/weather_states.dart';
import 'default_weather_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //weather animation
  getWeatherAnimation(String weatherCondition) {
    switch (weatherCondition.toLowerCase()) {
      case 'rain':
        return 'assets/images/rain.json';
      case 'clouds':
        return 'assets/images/cloud.json';
      case 'snow':
        return 'assets/images/snow.json';
      case 'sun':
      case 'clear':
        return 'assets/images/sun.json';
      default:
        return 'assets/images/sun.json';
    }
  }

  void getWeatherCondition() {
    //Sunny day Walk
    //It's raining now
    //Take your umbrella
    //Take you scarf
  }

  @override
  Widget build(BuildContext context) {
    //var weatherCubit = BlocProvider.of<WeatherCubit>(context);
    //var weather = BlocProvider.of<WeatherCubit>(context).weatherCubitModel;

    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherDefaultState) {
            //return const DefaultWeatherInfoView();
            return const WeatherViewInfo();
          } else if (state is WeatherLoadedState) {
            return const WeatherViewInfo();
          } else {
            //return const CircularProgressIndicator();
            return Center(child: const Text('Try again'));
          }
        },
      ),
    );
  }
}
