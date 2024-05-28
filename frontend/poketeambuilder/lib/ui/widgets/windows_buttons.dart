import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';

var buttonColors = WindowButtonColors(
  iconNormal: Constants.blue,
  mouseOver: Constants.blue,
  mouseDown: Constants.red,
  iconMouseOver: Constants.darkBlue,
  iconMouseDown: Constants.grey,
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