import 'package:flutter/material.dart';
import 'package:weather_app/features/splash_screen/presentation/views/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SplashViewBody(),
    );
  }
}
