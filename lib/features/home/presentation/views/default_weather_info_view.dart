import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/weather_cubit/weather_cubit.dart';


class DefaultWeatherInfoView extends StatelessWidget {
  const DefaultWeatherInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherCubit = BlocProvider.of<WeatherCubit>(context);
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('assets/images/sun.png',height: 40,),
            Image.asset('assets/images/cloudy.png',height: 40,),
            Image.asset('assets/images/sun.png',height: 40,),
            Image.asset('assets/images/cloudy.png',height: 40,),


          ],),
          const Text(
            'Weather for any city',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Country or City',
              focusColor: Colors.red,
            ),
            onSubmitted: (value) {
              weatherCubit.getWeather(cityName: value);

              //getWeather();
            },
          ),
        ],
      ),
    );
  }
}
