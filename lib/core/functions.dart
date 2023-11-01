import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//get theme color
MaterialColor getThemeColor(String weatherCondition) {
  switch (weatherCondition.toLowerCase()) {
    case 'rain':
      return Colors.blue;
    case 'clouds':
    case 'haze':
      return Colors.blueGrey;
    case 'snow':
      return Colors.lightBlue;
    case 'sun':
    case 'clear':
      return Colors.teal;
    default:
      return Colors.deepPurple;
  }
}

//get current city
Future<String> getCurrentCity() async {
//get permission from user
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

//fetch current location
  Position position = await Geolocator.getCurrentPosition(
      // desiredAccuracy: LocationAccuracy.high

  );

//convert location in to of place-mark
  List<Placemark> placemarks =
  await placemarkFromCoordinates(position.latitude, position.longitude);

//extract city name from the first place-mark
  String? city = placemarks[0].locality ?? 'city';
  print('==================================');
  print(city);
  return city;
}

