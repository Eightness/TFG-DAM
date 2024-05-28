import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/screens/home.dart';
import 'package:poketeambuilder/config/theme/app_theme.dart';
import 'package:poketeambuilder/ui/widgets/windows_buttons.dart';
import 'package:poketeambuilder/utils/constants.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(1280, 720);
    appWindow.size = initialSize;
    appWindow.minSize = const Size(600, 600);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeTeam Builder',
      theme: AppTheme().generateTheme(),
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Container(
            color: Constants.darkBlue,
            child: WindowTitleBarBox(
              child: MoveWindow(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    WindowButtons(),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: Home(),
          ),
        ],
      ),
    );
  }
}
