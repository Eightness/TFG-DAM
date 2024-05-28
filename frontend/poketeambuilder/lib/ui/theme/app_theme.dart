import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AppTheme {

  ThemeData generateTheme() {
    return ThemeData(
      primaryColor: Constants.blue,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,

          primary: Constants.blue,
          primaryContainer: Constants.darkBlue,
          onPrimary: Constants.darkBrown,

          secondary: Constants.red,
          secondaryContainer: Constants.darkRed,
          onSecondary: Constants.grey,

          tertiary: Constants.brown,
          tertiaryContainer: Constants.darkBrown,
          onTertiary: Constants.grey,

          error: Constants.darkRed,
          onError: Constants.grey,

          background: Constants.blue,
          onBackground: Constants.grey,

          surface: Constants.grey,
          onSurface: Constants.darkBrown,
      )
    );
  }
}