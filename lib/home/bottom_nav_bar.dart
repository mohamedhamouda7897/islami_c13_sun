import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  Function onChange;

  BottomNavBar({required this.onChange, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          widget.onChange(currentIndex);
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFE2BE7F),
              icon: _buildNavItem("quran", 0),
              label: "Quran"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFE2BE7F),
              icon: _buildNavItem("ahadeth", 1),
              label: "Hadith"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFE2BE7F),
              icon: _buildNavItem("sebha", 2),
              label: "Tasbeeh"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFE2BE7F),
              icon: _buildNavItem("ic_radio", 3),
              label: "Radio"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFE2BE7F),
              icon: _buildNavItem("dates", 4),
              label: "Time"),
        ]);
  }

  Widget _buildNavItem(String imageName, int index) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Color(0x80202020)),
            child: ImageIcon(
              AssetImage("assets/images/$imageName.png"),
            ),
          )
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
          );
  }
}
