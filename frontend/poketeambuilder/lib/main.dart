import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/config/theme/app_theme.dart';
import 'package:poketeambuilder/ui/screens/tabs/register.dart';
import 'package:poketeambuilder/ui/screens/tabs/signin.dart';
import 'package:poketeambuilder/ui/screens/welcome.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    appWindow.maximize();
    appWindow.minSize = const Size(1200, 800);
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
