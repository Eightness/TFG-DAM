import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poketeambuilder/utils/constants.dart';

class PokemonBuilder extends StatelessWidget {
  const PokemonBuilder({Key? key}) : super(key: key);

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
                  items: const [
                    DropdownMenuItem(value: 'Option1', child: Text('Pikachu')),
                    DropdownMenuItem(value: 'Option2', child: Text('Bulbasaur')),
                  ],
                  onChanged: (value) {},
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
                  items: const [
                    DropdownMenuItem(value: 'Option1', child: Text('Poké Ball')),
                    DropdownMenuItem(value: 'Option2', child: Text('Potion')),
                  ],
                  onChanged: (value) {},
                  hint: const Text('Item'),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(value: 'Option1', child: Text('Intimidate')),
                    DropdownMenuItem(value: 'Option2', child: Text('Transform')),
                  ],
                  onChanged: (value) {},
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
                  items: const [
                    DropdownMenuItem(value: 'Option1', child: Text('Adamant')),
                    DropdownMenuItem(value: 'Option2', child: Text('Modest')),
                  ],
                  onChanged: (value) {},
                  hint: const Text('Nature'),
                ),
                for (int i = 1; i <= 4; i++)
                  DropdownButton<String>(
                    items: const [
                      DropdownMenuItem(value: 'Option1', child: Text('Tackle')),
                      DropdownMenuItem(value: 'Option2', child: Text('Tail')),
                    ],
                    onChanged: (value) {},
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
                    SizedBox(width: 60.0, child: _buildStatInput('EV', 252)),
                    const SizedBox(width: 8.0),
                    SizedBox(width: 60.0, child: _buildStatInput('IV', 31)),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildStatInput(String label, int maxValue) {
    return SizedBox(
      width: 60.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '0-$maxValue',
          labelText: label,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
          _MaxValueInputFormatter(maxValue),
        ],
      ),
    );
  }
}

class _MaxValueInputFormatter extends TextInputFormatter {
  final int maxValue;

  _MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null || intValue > maxValue) {
      return oldValue;
    }
    return newValue;
  }
}
