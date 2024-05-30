import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';

var buttonColors = WindowButtonColors(
  iconNormal: Constants.white,
  mouseOver: Constants.darkRed,
  mouseDown: Constants.blue,
  iconMouseOver: Constants.grey,
  iconMouseDown: Constants.darkBlue,
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: buttonColors)
      ],
    );
  }
}