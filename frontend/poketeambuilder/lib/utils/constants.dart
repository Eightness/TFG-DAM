import 'package:flutter/material.dart';

class Constants {
  static bool isDarkTheme = false;

  static Color get blue => isDarkTheme ? Color(0xFF444B4D) : Color(0xFF9FBCC1);

  static Color get darkBlue =>
      isDarkTheme ? Color(0xFF272D2D) : Color(0xFF4E6466);

  static Color get red => isDarkTheme ? Color(0xFF282424) : Color(0xFFBF4747);

  static Color get chillRed =>
      isDarkTheme ? Color(0xFF595151) : Color(0xFFBB8282);

  static Color get darkRed =>
      isDarkTheme ? Color(0xFF171515) : Color(0xFFAD3737);

  static Color get brown => isDarkTheme ? Color(0xFFD8D8D6) : Color(0xff615148);

  static Color get darkBrown =>
      isDarkTheme ? Color(0xFF483C3C) : Color(0xFF483C3C);

  static Color get yellow => Color(0xFFECE474);

  static Color get grey => Color(0xFFD8D8D6);

  static Color get darkGrey => Color(0xFF9D9A9A);

  static Color get white => isDarkTheme ? Color(0xFFD8D8D6) : Colors.white;

  static Color get black => isDarkTheme ? Colors.black : Colors.black;

  static void updateTheme(bool isDark) {
    isDarkTheme = isDark;
  }
}
