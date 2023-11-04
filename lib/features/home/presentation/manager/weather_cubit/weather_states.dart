import 'package:equatable/equatable.dart';
import '../../../data/weather_model.dart';

class  WeatherState {
    // extends Equatable{
  // @override
  // List<Object?> get props => throw UnimplementedError();

}

class WeatherInitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState(this.weather);
}

class WeatherFailureState extends WeatherState{
      final String errorMessage;

  WeatherFailureState(this.errorMessage);
}

