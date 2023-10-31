import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';
import '../../../../services/weather_services.dart';
import '../../../data/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // WeatherCubit(super.WeatherDefaultState);
  WeatherCubit() : super(WeatherInitialState());
  //late Weather weatherCubitModel;

  // getDefaultWeather() async {
  //   String cityName = 'Japan';
  //   try {
  //     weatherCubitModel =
  //         await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
  //     emit(WeatherDefaultState(weatherCubitModel));
  //   } catch (e) {
  //     emit(WeatherFailureState());
  //   }
  // }

  getWeather({required String cityName}) async {
    print('get fun');
    try {
      print('try get fun');
      Weather weatherCubitModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      print('before emit');
      emit(WeatherLoadedState(weatherCubitModel));
      print('after emit');
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ));
    }
  }
}
