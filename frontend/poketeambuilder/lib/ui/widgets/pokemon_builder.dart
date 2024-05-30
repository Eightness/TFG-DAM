import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poketeambuilder/utils/constants.dart';

class PokemonBuilder extends StatelessWidget {
  const PokemonBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
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
            width: 200.0,
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
                // Utiliza un Image.asset para mostrar la imagen del sprite
                Image.asset(
                  'assets/images/pokeball.png', // Ruta de la imagen
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
          const SizedBox(width: 12.0),
          // Second Column
          SizedBox(
            width: 200.0, // Ancho fijo para la segunda columna
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
          const SizedBox(width: 12.0),
          // Third Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('EVs'),
              for (int i = 0; i < 6; i++)
                _buildStatInput('', 252), // Sin etiqueta para los EVs
            ],
          ),
          const SizedBox(width: 12.0),
          // Fourth Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('IVs'),
              for (int i = 0; i < 6; i++)
                _buildStatInput('', 31), // Sin etiqueta para los IVs
            ],
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
