import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants.dart';

class PokemonBuilder extends StatefulWidget {
  final List<String>? pokemonOptions;
  final List<String>? itemOptions;
  final List<String>? abilityOptions;
  final List<String>? natureOptions;
  final List<String>? moveOptions;
  final List<int?>? initialEVs;
  final List<int?>? initialIVs;

  const PokemonBuilder({
    Key? key,
    this.pokemonOptions,
    this.itemOptions,
    this.abilityOptions,
    this.natureOptions,
    this.moveOptions,
    this.initialEVs,
    this.initialIVs,
  }) : super(key: key);

  @override
  _PokemonBuilderState createState() => _PokemonBuilderState();
}

class _PokemonBuilderState extends State<PokemonBuilder> {
  String? _selectedPokemon;
  String? _selectedItem;
  String? _selectedAbility;
  String? _selectedNature;
  List<String?> _selectedMoves = List.filled(4, null);
  List<int?> _selectedEVs = List.filled(6, null);
  List<int?> _selectedIVs = List.filled(6, null);

  @override
  void initState() {
    super.initState();
    _selectedEVs = List.from(widget.initialEVs ?? List.filled(6, null));
    _selectedIVs = List.from(widget.initialIVs ?? List.filled(6, null));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Constants.white, Constants.grey],
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          // First Column
          SizedBox(
            width: 125.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: _selectedPokemon,
                  items: const [
                    DropdownMenuItem(value: 'Pikachu', child: Text('Pikachu')),
                    DropdownMenuItem(value: 'Bulbasaur', child: Text('Bulbasaur')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedPokemon = value;
                    });
                  },
                  hint: const Text('Pokémon'),
                ),
                const SizedBox(height: 8.0),
                Image.asset(
                  'assets/images/pokeball.png',
                  height: 110.0,
                  width: 110.0,
                ),
                const SizedBox(height: 8.0),
                DropdownButton<String>(
                  value: _selectedItem,
                  items: const [
                    DropdownMenuItem(value: 'Poké Ball', child: Text('Poké Ball')),
                    DropdownMenuItem(value: 'Potion', child: Text('Potion')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                  hint: const Text('Item'),
                ),
                DropdownButton<String>(
                  value: _selectedAbility,
                  items: const [
                    DropdownMenuItem(value: 'Intimidate', child: Text('Intimidate')),
                    DropdownMenuItem(value: 'Transform', child: Text('Transform')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedAbility = value;
                    });
                  },
                  hint: const Text('Ability'),
                ),
              ],
            ),
          ),
          // Second Column
          SizedBox(
            width: 125.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: _selectedNature,
                  items: const [
                    DropdownMenuItem(value: 'Adamant', child: Text('Adamant')),
                    DropdownMenuItem(value: 'Modest', child: Text('Modest')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedNature = value;
                    });
                  },
                  hint: const Text('Nature'),
                ),
                for (int i = 1; i <= 4; i++)
                  DropdownButton<String>(
                    value: _selectedMoves[i - 1],
                    items: const [
                      DropdownMenuItem(value: 'Tackle', child: Text('Tackle')),
                      DropdownMenuItem(value: 'Tail', child: Text('Tail')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedMoves[i - 1] = value;
                      });
                    },
                    hint: Text('Move $i'),
                  ),
              ],
            ),
          ),
          // Third Column
          Column(
            children: List.generate(6, (index) {
              String statLabel;
              switch (index) {
                case 0:
                  statLabel = 'Attack';
                  break;
                case 1:
                  statLabel = 'Special Attack';
                  break;
                case 2:
                  statLabel = 'Defense';
                  break;
                case 3:
                  statLabel = 'Special Defense';
                  break;
                case 4:
                  statLabel = 'Speed';
                  break;
                case 5:
                default:
                  statLabel = 'Health Points';
                  break;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    SizedBox(width: 60.0, child: Text(statLabel)),
                    const SizedBox(width: 8.0),
                    SizedBox(width: 60.0, child: _buildStatInput('EV', 252, index)),
                    const SizedBox(width: 8.0),
                    SizedBox(width: 60.0, child: _buildStatInput('IV', 31, index)),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildStatInput(String label, int maxValue, int index) {
    return SizedBox(
      width: 60.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{1,3}$')),
          _StatInputFormatter(maxValue),
        ],
        onChanged: (value) {
          int? intValue = int.tryParse(value);
          if (intValue != null) {
            setState(() {
              if (label == 'EV') {
                _selectedEVs[index] = intValue;
              } else if (label == 'IV') {
                _selectedIVs[index] = intValue;
              }
            });
          }
        },
        decoration: InputDecoration(
          hintText: '0-$maxValue',
          labelText: label,
          isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        ),
      ),
    );
  }
}

class _StatInputFormatter extends TextInputFormatter {
  final int maxValue;

  _StatInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null || intValue > maxValue) {
      return TextEditingValue(
        text: oldValue.text,
        selection: oldValue.selection,
      );
    }
    return newValue;
  }
}
