class Weather {
  String cityName;
  double temperature;
  String condition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
  });

  factory Weather.fromJson(json) {
    return Weather(
      cityName: '',
      temperature: 0,
      condition: '',
    );
  }
}
