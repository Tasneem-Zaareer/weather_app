import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';
import '../../../../services/weather_services.dart';
import '../../../data/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // WeatherCubit(super.WeatherDefaultState);
  WeatherCubit() : super(WeatherDefaultState());
  Weather? weatherCubitModel;


  getDefaultWeather() async {
    String cityName = 'Japan';
    try {
      weatherCubitModel =
      await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherCubitModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  getWeather({required String cityName}) async {
    try {
      weatherCubitModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherCubitModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
