import 'package:equatable/equatable.dart';
import '../../../data/weather_model.dart';

class  WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class WeatherInitialState extends WeatherState{}

class WeatherDefaultState extends WeatherState{
  final Weather weather;
  WeatherDefaultState(this.weather);
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState(this.weather);
}

class WeatherFailureState extends WeatherState{

}

