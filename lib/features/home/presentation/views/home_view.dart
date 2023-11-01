import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
  void getWeatherCondition() {
    //Sunny day Walk
    //It's raining now
    //Take your umbrella
    //Take you scarf
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
      if (state is WeatherDefaultState) {
        return const DefaultWeatherInfoView(
        );
      }
          else if (state is WeatherLoadedState) {
            return WeatherViewInfo(
              weatherModel: state.weather,
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
