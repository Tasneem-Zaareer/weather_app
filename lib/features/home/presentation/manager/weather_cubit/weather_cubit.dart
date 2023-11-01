import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/functions.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';
import '../../../../services/weather_services.dart';
import '../../../data/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  // WeatherCubit(super.WeatherDefaultState);
  WeatherCubit() : super(WeatherInitialState());
  bool defaultCity = true;
  getWeather({required String cityName}) async {

    String city = await getCurrentCity();
    if(defaultCity == true){cityName = city;}
    try {
      Weather weatherCubitModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      defaultCity=false;
      emit(WeatherLoadedState(weatherCubitModel));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ),
      );
    }
  }
}
