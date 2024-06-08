import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/team.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/ui/widgets/pokemon_display.dart';
import 'package:poketeambuilder/utils/constants.dart';
import '../../../data/models/pokemon.dart';
import '../../widgets/pokemon_builder.dart';

class TeamDisplay extends StatefulWidget {
  final Trainer currentTrainer;
  final Team team;

  TeamDisplay({Key? key, required this.currentTrainer, required this.team}) : super(key: key);

  @override
  _TeamDisplayState createState() => _TeamDisplayState();
}

class _TeamDisplayState extends State<TeamDisplay> {
    List<PokemonDisplay> _pokemonDisplayers = [];
    late List<Pokemon> _pokemonFromTeam;

  @override
  void initState() {
    super.initState();
    _pokemonFromTeam = widget.team.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Constants.blue, Constants.darkBlue],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(300.0, 50.0, 300.0, 50.0),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 1920) {
                    crossAxisCount = 2;
                  }
                  if (constraints.maxWidth < 1232) {
                    crossAxisCount = 1;
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 50.0,
                      mainAxisSpacing: 50.0,
                      childAspectRatio: 1.75,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      if (_pokemonDisplayers.length <= index) {
                        _pokemonDisplayers.add(
                          PokemonDisplay(
                            pokemon: _pokemonFromTeam[index],
                          ),
                        );
                      }
                      return _pokemonDisplayers[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
