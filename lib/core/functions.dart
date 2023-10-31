import 'package:flutter/material.dart';

//get location


//get theme color
MaterialColor getThemeColor(String weatherCondition) {
  switch (weatherCondition.toLowerCase()) {
    case 'rain':
      return Colors.blue;
    case 'clouds':
      return Colors.blueGrey;
    case 'snow':
      return Colors.lightBlue;
    case 'sun':
    case 'clear':
      return Colors.yellow;
    default:
      return Colors.green;
  }
}
//get weather animation function
String getWeatherAnimation({required String weatherCondition}) {
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