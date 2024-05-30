import 'package:flutter/material.dart';
import 'pokemon_builder.dart';

class TeamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 3; // Default to 3 columns
          if (constraints.maxWidth < 1920) {
            crossAxisCount = 2; // Change to 2 column for small screens
          }
          if (constraints.maxWidth < 1280) {
            crossAxisCount = 1; // Change to 1 column for very small screens
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
              return PokemonBuilder();
            },
          );
        },
      ),
    );
  }
}
