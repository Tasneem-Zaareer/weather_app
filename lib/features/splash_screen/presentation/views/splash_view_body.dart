import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    timerPageNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Lottie.asset(
            'assets/images/sun_splashscreen.json',
            height: 300,
          ),
          const Text(
            'Jaw',
            style: TextStyle(
              fontSize: 75,
            ),
          ),
          const Text(
            'Travel the world with us',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Timer timerPageNavigator() {
    return Timer(
      const Duration(seconds: 5),
      () {
        Get.to(()=> const HomeView());
      },
    );
  }
}
