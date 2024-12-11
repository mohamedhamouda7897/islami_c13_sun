import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color primaryDarkColor = Color(0xFFE2BE7F);
  static const Color blackColor = Color(0xFF202020);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: blackColor,
        centerTitle: true,
        titleTextStyle: GoogleFonts.aBeeZee(
            color: const Color(0xFFE2BE7F),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: primaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFE2BE7F),
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFF202020),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo2(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.exo2(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyLarge: GoogleFonts.exo2(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleSmall: GoogleFonts.elMessiri(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.elMessiri(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
