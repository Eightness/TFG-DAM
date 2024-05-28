import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/custom_scaffold.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold();
  }
}
