import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';
import '../../../../services/weather_services.dart';
import '../../../data/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // WeatherCubit(super.WeatherDefaultState);
  WeatherCubit() : super(WeatherInitialState());
  late Weather weatherCubitModel;

  getDefaultWeather() async {
    String cityName = 'Japan';
    try {
      weatherCubitModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherDefaultState(weatherCubitModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  getWeather({required String cityName}) async {
    try {
      weatherCubitModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherCubitModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  //weather animation
  getWeatherAnimation({required String weatherCondition}) {
    // if(weatherCondition.toLowerCase() == 'rain'){
    //   return 'assets/images/rain.json';
    // }
    // else{
    //   return 'assets/images/cloud.json';
    // }
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
}
