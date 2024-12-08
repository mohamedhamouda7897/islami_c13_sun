import 'package:flutter/material.dart';
import 'package:islami_c13_sunday/home/home.dart';
import 'package:islami_c13_sunday/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
