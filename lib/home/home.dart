import 'package:flutter/material.dart';
import 'package:islami_c13_sunday/home/bottom_nav_bar.dart';
import 'package:islami_c13_sunday/home/tabs/ahadeth_tab.dart';
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
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavBar(onChange: (index) {
          currentIndex = index;
          setState(() {});
        }),
        body: tabs[currentIndex],
      ),
    );
  }

  List<Widget> tabs = [
     QuranTab(),
    const AhadethTab(),
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
