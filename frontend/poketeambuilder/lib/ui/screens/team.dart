import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/custom_scaffold.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);


  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold();
  }
}
