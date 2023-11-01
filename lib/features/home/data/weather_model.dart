class Weather {
  String cityName;
  double temperature;
  String weatherCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
  });

  factory Weather.fromJson(json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      weatherCondition: json['weather'][0]['main'],
    );
  }
}
