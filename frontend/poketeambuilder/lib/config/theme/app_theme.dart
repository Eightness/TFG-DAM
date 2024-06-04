import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AppTheme {

  ThemeData generateTheme() {
    return ThemeData(
      primaryColor: Constants.red,
      colorScheme: ColorScheme(
          brightness: Brightness.light,

          primary: Constants.blue,
          primaryContainer: Constants.white,
          onPrimary: Constants.white,

          secondary: Constants.red,
          secondaryContainer: Constants.darkRed,
          onSecondary: Constants.grey,

          tertiary: Constants.brown,
          tertiaryContainer: Constants.red,
          onTertiary: Constants.grey,

          error: Constants.darkRed,
          onError: Constants.grey,

          background: Constants.grey,
          onBackground: Constants.darkBrown,

          surface: Constants.grey,
          onSurface: Constants.darkBrown,
      )
    );
  }
}