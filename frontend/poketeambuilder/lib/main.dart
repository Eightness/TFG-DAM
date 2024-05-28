import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/screens/home.dart';
import 'package:poketeambuilder/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeTeam Builder',
      theme: AppTheme().generateTheme(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

