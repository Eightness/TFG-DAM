import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/config/theme/app_theme.dart';
import 'package:poketeambuilder/ui/widgets/app_structure.dart';
import 'package:poketeambuilder/ui/widgets/community_widget.dart';
import 'package:poketeambuilder/ui/widgets/team_builder.dart';
import 'package:poketeambuilder/ui/widgets/windows_buttons.dart';
import 'package:poketeambuilder/utils/constants.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(1920, 1080);
    appWindow.size = initialSize;
    appWindow.minSize = const Size(1280, 1000);
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
            color: Constants.red,
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
          Expanded(
            child: AppStructure(
              teamContent: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Constants.blue, Constants.darkBlue],
                  ),
                ),
                child: TeamBuilder(),
              ),
              communityContent: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Constants.blue, Constants.darkBlue],
                  ),
                ),
                child: Community(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
