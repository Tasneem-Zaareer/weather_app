import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../manager/weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey.shade700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                  height: 30,
                ),
                Image.asset(
                  'assets/images/sun.png',
                  height: 30,
                ),
                Image.asset(
                  'assets/images/cloudy.png',
                  height: 30,
                ),
                Image.asset(
                  'assets/images/sun.png',
                  height: 30,
                ),
              ],
            ),
            const Text(
              'Check the weather for any place',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: 'country or city',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onSubmitted: (value) async {
                var weatherCubit = BlocProvider.of<WeatherCubit>(context);
                weatherCubit.getWeather(cityName: value);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
