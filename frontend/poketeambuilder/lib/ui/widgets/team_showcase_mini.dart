import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar el paquete intl para formatear fechas

import '../../utils/constants.dart';

class TeamShowcaseMini extends StatelessWidget {
  final int index;
  final bool isCurrentTrainer;

  const TeamShowcaseMini(
      {Key? key, required this.index, this.isCurrentTrainer = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                'Team${index + 1} - Username',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                ],
              ),
            ),
            if (isCurrentTrainer)
              Positioned(
                right: 0,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Constants.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Constants.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 10,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Constants.red,
                      onPrimary: Constants.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Constants.white),
                        SizedBox(width: 5),
                        Text(
                          '25',
                          style: TextStyle(
                            fontSize: 14,
                            color: Constants.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.blue,
                    ),
                    child: Text('Comments'),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: Text(
                'Created: $formattedDate',
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.darkBrown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
