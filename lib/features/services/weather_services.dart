import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../home/data/weather_model.dart';

// class weather services to create needed weather methods
class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = '87d0ece569fee9a09dacd04914c6f3b6';


  //
  //get current weather method
  Future<Weather> getCurrentWeather(String cityName) async{
    Response response = await dio.get('$baseUrl/weather?q=$cityName&appid=$apiKey');
    Weather weather = Weather.fromJson(response.data);
    return weather;
  }

  //get current city

  //get permission from user

  //fetch current location

  //convert location in to of place-mark

  //extract city name from the first place-mark

}