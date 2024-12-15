import 'package:flutter/material.dart';
import 'package:islami_c13_sunday/home/bottom_nav_bar.dart';
import 'package:islami_c13_sunday/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_c13_sunday/home/tabs/date_tab.dart';
import 'package:islami_c13_sunday/home/tabs/quranTab/quran_tab.dart';
import 'package:islami_c13_sunday/home/tabs/radio_tab.dart';
import 'package:islami_c13_sunday/home/tabs/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/${getBackgroundImageName()}.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(onChange: (index) {
          currentIndex = index;
          setState(() {});
        }),
        body: Column(
          children: [
            Image.asset("assets/images/onboarding_header.png"),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
     AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const DateTab()
  ];

  String getBackgroundImageName() {
    switch (currentIndex) {
      case 0:
        return "home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";

      default:
        return "home_bg";
    }
  }
}
