import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/functions.dart';
import '../../data/weather_model.dart';
import '../manager/weather_cubit/weather_cubit.dart';

class WeatherViewInfo extends StatelessWidget {
  const WeatherViewInfo({
    super.key,
    required this.weatherModel,
  });

  final Weather weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition).shade400,
            getThemeColor(weatherModel.weatherCondition).shade100,
            getThemeColor(weatherModel.weatherCondition).shade50,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25.0,
          right: 25.0,
          bottom: 75,
        ),
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
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Weather for another city',
                          textCancel: 'cancel',
                          textConfirm: 'search',
                          content: TextField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.clear),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onSubmitted: (value) async {
                              var weatherCubit =
                                  BlocProvider.of<WeatherCubit>(context);
                              weatherCubit.getWeather(cityName: value);
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 75),
                Center(
                  child: Lottie.asset(
                    getWeatherAnimation(
                        weatherCondition: weatherModel.weatherCondition),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
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

                  //Text(getCurrentCity() as String),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //get weather animation
  String getWeatherAnimation({required String weatherCondition}) {
    switch (weatherCondition.toLowerCase()) {
      case 'rain':
        return 'assets/images/rain.json';
      case 'clouds':
      case 'haze':
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
}
