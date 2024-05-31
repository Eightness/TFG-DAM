import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'pokemon_builder.dart';

class TeamBuilder extends StatefulWidget {
  @override
  _TeamBuilderState createState() => _TeamBuilderState();
}

class _TeamBuilderState extends State<TeamBuilder> {
  String selectedGeneration = 'Generation 1';
  bool isPublic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  items: List.generate(9, (index) {
                    return DropdownMenuItem<String>(
                      value: 'Generation ${index + 1}',
                      child: Text('Generation ${index + 1}'),
                    );
                  }),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Constants.white,
                    backgroundColor: Constants.red,
                  ),
                  child: Text('Stats'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {},
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
    );
  }
}
