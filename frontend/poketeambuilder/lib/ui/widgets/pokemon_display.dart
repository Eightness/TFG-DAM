import 'package:flutter/material.dart';
import '../../data/models/pokemon.dart';
import '../../utils/constants.dart';

class PokemonDisplay extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDisplay({required this.pokemon});

  @override
  PokemonDisplayState createState() => PokemonDisplayState();
}

class PokemonDisplayState extends State<PokemonDisplay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Constants.white, Constants.grey.withOpacity(0.3)],
        ),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(  // Center widget added here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Aligning the content in the Row to the center
          children: [
            // First Column
            SizedBox(
              width: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.pokemon.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      if (widget.pokemon.isShiny)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18.0,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Image.network(
                    widget.pokemon.spriteUrl.isNotEmpty ? widget.pokemon.spriteUrl : 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/f720bb6e-b303-4877-bffb-d61df0ab183f/d3b98cf-4fc5c76b-2a99-47fc-98b6-d7d4ee8d9d9f.png',
                    height: 90.0,
                    width: 90.0,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.pokemon.nature,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0),
            // Second Column
            SizedBox(
              width: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pokemon.item,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    widget.pokemon.ability,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  for (int i = 0; i < widget.pokemon.moves.length; i++)
                    Text(
                      widget.pokemon.moves[i].name.isNotEmpty ? widget.pokemon.moves[i].name : 'Move ${i + 1}: None.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  for (int i = widget.pokemon.moves.length; i < 4; i++)
                    Text(
                      'Move ${i + 1} not selected.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                ],
              ),
            ),
            SizedBox(width: 20.0),
            // Third Column
            Expanded(
              child: Column(
                children: List.generate(6, (index) {
                  String statLabel;
                  int ivValue;
                  int evValue;
                  switch (index) {
                    case 0:
                      statLabel = 'Attack';
                      ivValue = widget.pokemon.ivAtk;
                      evValue = widget.pokemon.evAtk;
                      break;
                    case 1:
                      statLabel = 'Sp. Attack';
                      ivValue = widget.pokemon.ivSpAtk;
                      evValue = widget.pokemon.evSpAtk;
                      break;
                    case 2:
                      statLabel = 'Defense';
                      ivValue = widget.pokemon.ivDef;
                      evValue = widget.pokemon.evDef;
                      break;
                    case 3:
                      statLabel = 'Sp. Defense';
                      ivValue = widget.pokemon.ivSpDef;
                      evValue = widget.pokemon.evSpDef;
                      break;
                    case 4:
                      statLabel = 'Speed';
                      ivValue = widget.pokemon.ivSpeed;
                      evValue = widget.pokemon.evSpeed;
                      break;
                    case 5:
                    default:
                      statLabel = 'HP';
                      ivValue = widget.pokemon.ivHealth;
                      evValue = widget.pokemon.evHealth;
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        SizedBox(width: 80.0, child: Text(statLabel)),
                        const SizedBox(width: 8.0),
                        SizedBox(width: 60.0, child: Text('IV: $ivValue')),
                        const SizedBox(width: 8.0),
                        SizedBox(width: 60.0, child: Text('EV: $evValue')),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
