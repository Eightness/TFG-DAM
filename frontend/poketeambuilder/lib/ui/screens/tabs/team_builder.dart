import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';

import '../../widgets/pokemon_builder.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  String selectedGeneration = 'All generations';
  bool isPublic = false;

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
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 300.0),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 1920) {
                    crossAxisCount = 2;
                  }
                  if (constraints.maxWidth < 1280) {
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
                      return PokemonBuilder();
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Constants.white, Constants.grey],
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: selectedGeneration,
                    items: [
                      DropdownMenuItem<String>(
                        value: 'All generations',
                        child: Text('All generations'),
                      ),
                      ...List.generate(9, (index) {
                        return DropdownMenuItem<String>(
                          value: 'Generation ${index + 1}',
                          child: Text('Generation ${index + 1}'),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGeneration = value!;
                      });
                    },
                    hint: Text('Generation'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Save'),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Constants.red,
                            content: SizedBox(
                              width: 800,
                              height: 800,
                              child: Image.asset('assets/images/typechart.png', fit: BoxFit.contain),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Constants.white
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Types'),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Random'),
                  ),
                  SizedBox(width: 20.0),
                  Row(
                    children: [
                      Checkbox(
                        value: isPublic,
                        onChanged: (value) {
                          setState(() {
                            isPublic = value!;
                          });
                        },
                      ),
                      Text('Public'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
