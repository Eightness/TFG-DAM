import 'package:flutter/material.dart';

class Constants {
  static bool isLightTheme = true;

  static Color get blue => isLightTheme ? Color(0xFF9FBCC1) : Color(0xFF444B4D);
  static Color get darkBlue => isLightTheme ? Color(0xFF4E6466) : Color(0xFF272D2D);
  static Color get red => isLightTheme ? Color(0xFFBF4747) : Color(0xFF282424);
  static Color get darkRed => isLightTheme ? Color(0xFFAD3737) : Color(0xFF171515);
  static Color get brown => isLightTheme ? Color(0xff615148) : Color(0xFFD8D8D6);
  static Color get darkBrown => isLightTheme ? Color(0xFF483C3C) : Color(0xFF483C3C);
  static Color get yellow => Color(0xFFECE474);
  static Color get grey => Color(0xFFD8D8D6);
  static Color get white => isLightTheme ? Colors.white : Color(0xFFD8D8D6);
  static Color get black => isLightTheme ? Colors.black : Colors.black;

  static void updateTheme(bool isLight) {
    isLightTheme = isLight;
  }
}
