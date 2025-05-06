import 'package:flutter/material.dart';

class CustomTheme {
  static Color primaryColor = testAppColor;

  CustomTheme._privateConstructor();
  static final CustomTheme _instance = CustomTheme._privateConstructor();
  factory CustomTheme() {
    return _instance;
  }
  void initializeTheme(Color selectedColor) {
    primaryColor = selectedColor;
  }

/* Infor Brain Solution Data */
  // static const Color appThemeColorPrimary = Colors.green;
  // static const Color appThemeColorSecondary = Color(0xFF1DB207);
  // static const Color tableColorPrimary = Color(0xFFD5EBEB);
  // static const Color tableColorSecondary = Color(0xFFFAFCFF);
  // static const Color tableColorHead = Color(0xFFD7ECED);
  // static const Color testAppColor = Color(0xFF010C80);
  // static const String footerText = 'Info Brain Solution Pvt. Ltd.';
  // static const String mainLogo = 'assets/icons/group.png';
  // static const String mainLogoWhite = 'assets/icons/balance.png';
  // static const double logoSize = 50;

/* For Finasol it solution */
  static const Color appThemeColorPrimary = Color(0xFF25aae1);
  static const Color appThemeColorSecondary = Color(0xFF0e75bd);
  static const Color tableColorHead = Color(0xFFb3eaf5);
  static const Color tableColorPrimary = Color(0xFFcae3e8);
  static const Color tableColorSecondary = Color(0xFFFAFCFF);
  static const Color testAppColor = Color(0xFF010C80);
  static const String footerText = 'Finansol IT Solutions';
  static const String mainLogo = 'assets/icons/finasol.png';
  static const String mainLogoWhite = 'assets/icons/finasol.png';
  static const double logoSize = 70;

  static const double symmetricHozPadding = 13.0;
  static const Color lightGray = Color(0XFFF3F3F3);
  static const Color gray = Color(0xFFDEDEDE);
  static const Color darkGray = Color(0xFF3E3E3E);
  static const Color lightTextColor = Color(0xff131313);
  static const Color yellow = Color(0xFFFFC107);
  static const Color green = Colors.green;
  static const Color backgroundColor = Color(0xFFECF4FF);
  static const Color googleColor = Color(0xFFDB4437);
  static const Color facebookColor = Color(0xFF4267B2);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFFD1D1D);
  static const Color linkedIn = Color(0xFF2867B2);
  static const Color orangeColor = Color(0xFFEF8767);
  static const Color shadowColor = Color(0x1A000000);
  static const Color darkerBlack = Color(0xff060606);
  static const Color darkTextColor = Color(0xfff8f8f8);
  static const Color spanishGray = Color(0xFF9D9D9D);

  static const Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    shadowColor: Colors.black,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: primaryColor)),
    scaffoldBackgroundColor: backgroundColor,
    iconTheme: const IconThemeData(color: darkerBlack),
    // fontFamily: Fonts.poppin,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 24),
      displayMedium: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 22),
      displaySmall: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 20),
      headlineMedium: TextStyle(fontSize: 18, color: lightTextColor),
      headlineSmall: TextStyle(color: lightTextColor, fontSize: 16),
      titleLarge: TextStyle(
          color: lightTextColor, fontSize: 14, fontWeight: FontWeight.w300),
      bodySmall: TextStyle(color: lightTextColor, fontSize: 8),
      titleSmall: TextStyle(color: lightTextColor, fontSize: 12),
      titleMedium: TextStyle(color: lightTextColor, fontSize: 10),
      labelLarge: TextStyle(color: lightTextColor, fontSize: 12),
      bodyLarge: TextStyle(fontSize: 12, color: lightTextColor),
      bodyMedium: TextStyle(fontSize: 10, color: lightTextColor),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    shadowColor: Colors.white,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: primaryColor)),
    scaffoldBackgroundColor: darkGray,
    iconTheme: const IconThemeData(color: Colors.white),
    // fontFamily: Fonts.poppin,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: darkTextColor, fontWeight: FontWeight.bold, fontSize: 24),
      displayMedium: TextStyle(
          color: darkTextColor, fontWeight: FontWeight.bold, fontSize: 22),
      displaySmall: TextStyle(
          color: darkTextColor, fontWeight: FontWeight.bold, fontSize: 20),
      headlineMedium: TextStyle(fontSize: 18, color: darkTextColor),
      headlineSmall: TextStyle(color: darkTextColor, fontSize: 16),
      titleLarge: TextStyle(
          color: darkTextColor, fontSize: 14, fontWeight: FontWeight.w300),
      bodySmall: TextStyle(color: darkTextColor, fontSize: 8),
      titleSmall: TextStyle(color: darkTextColor, fontSize: 12),
      titleMedium: TextStyle(color: darkTextColor, fontSize: 10),
      labelLarge: TextStyle(color: darkTextColor, fontSize: 12),
      bodyLarge: TextStyle(fontSize: 12, color: darkTextColor),
      bodyMedium: TextStyle(fontSize: 10, color: darkTextColor),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: darkGray),
  );
}
