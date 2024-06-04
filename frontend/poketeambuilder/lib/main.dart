import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/config/theme/app_theme.dart';
import 'package:poketeambuilder/ui/screens/tabs/register.dart';
import 'package:poketeambuilder/ui/screens/tabs/signin.dart';
import 'package:poketeambuilder/ui/screens/welcome.dart';

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
        home: Welcome(
          signIn: SignIn(),
          register: Register(),
        ));
  }
}
