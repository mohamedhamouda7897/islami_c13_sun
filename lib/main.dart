import 'package:flutter/material.dart';
import 'package:islami_c13_sunday/cache/cache_helper.dart';
import 'package:islami_c13_sunday/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_sunday/home/home.dart';
import 'package:islami_c13_sunday/my_theme_data.dart';
import 'package:islami_c13_sunday/onboarding_screen.dart';
import 'package:islami_c13_sunday/sura_details/sura_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper.getEligibility() == true
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
