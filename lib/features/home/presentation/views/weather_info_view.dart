import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/home/presentation/views/search_view.dart';

import '../manager/weather_cubit/weather_cubit.dart';

class WeatherViewInfo extends StatelessWidget {
  const WeatherViewInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider
        .of<WeatherCubit>(context)
        .weatherCubitModel;
    var weatherCubit = BlocProvider.of<WeatherCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 25.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                '${weatherModel.weatherCondition} day walk',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Lottie.asset(
            weatherCubit.getWeatherAnimation(
                weatherCondition: weatherModel.weatherCondition
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 25),
    Column(
    children: [
    const Text(
    'Weather for another city',
    style: TextStyle(
    color: Colors.deepPurple,
    fontSize: 18,
    ),
    ),
    const SizedBox(height: 15),
    TextField(
    decoration: InputDecoration(
    suffixIcon: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.clear),
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    hintText: 'Country or City',
    focusColor: Colors.red,
    ),
    onSubmitted: (value) {
    var weatherCubit = BlocProvider.of<WeatherCubit>(context);
    weatherCubit.getWeather(cityName: value);

    //getWeather();
    },
    ),
    ],
    ),
    const SizedBox(height: 100),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    weatherModel.cityName,
    style: TextStyle(
    fontSize: 24,
    color: Colors.grey.shade700,
    ),
    ),
    Text(
    '${weatherModel.temperature.round().toString()}°C',
    style: const TextStyle(
    fontSize: 60,
    color: Colors.deepPurple,
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
  }
}
