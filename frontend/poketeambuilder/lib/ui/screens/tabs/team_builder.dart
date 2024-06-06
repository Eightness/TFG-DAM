import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/comment.dart';
import 'package:poketeambuilder/data/models/pokemon.dart';
import 'package:poketeambuilder/data/models/team.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/services/pokeapi_service.dart';
import '../../widgets/pokemon_builder.dart';

class TeamBuilder extends StatefulWidget {
  final Trainer currentTrainer;

  const TeamBuilder({Key? key, required this.currentTrainer}) : super(key: key);

  @override
  _TeamBuilderState createState() => _TeamBuilderState();
}

class _TeamBuilderState extends State<TeamBuilder> {
  String _selectedGeneration = 'All generations';
  List<String>? _currentGeneration;
  bool _isPublic = false;

  final PokeAPIService _pokeAPIService = PokeAPIService();
  final TeamService _teamService = TeamService();
  late final List<String>? _itemList;
  late final List<String>? _naturesList;

  List<GlobalKey<PokemonBuilderState>> _pokemonBuilderKeys = List.generate(
    6,
        (_) => GlobalKey<PokemonBuilderState>(),
  );

  List<PokemonBuilder> _pokemonBuilders = [];

  @override
  void initState() {
    super.initState();
    _fetchAllPokemonNames();
    _fetchItems();
    _fetchNatures();
    _pokemonBuilders = List.generate(
      6,
          (index) => PokemonBuilder(
        currentGeneration: _currentGeneration,
        key: _pokemonBuilderKeys[index],
      ),
    );
  }

  Future<void> _fetchAllPokemonNames() async {
    try {
      List<String> allPokemonNames = await _pokeAPIService.fetchAllPokemonNames();
      setState(() {
        _currentGeneration = allPokemonNames;
      });
      _updatePokemonBuilders();
    } catch (e) {
      print('Error fetching all Pokémon names: $e');
    }
  }

  Future<void> _updateCurrentGeneration(String generation) async {
    _resetPokemonBuilders();

    if (generation == 'All generations') {
      await _fetchAllPokemonNames();
    } else {
      int generationNumber = int.parse(generation.split(' ').last);
      List<String> pokemonNames = await _pokeAPIService.fetchPokemonNamesByGeneration(generationNumber);
      setState(() {
        _currentGeneration = pokemonNames;
      });
      _updatePokemonBuilders();
    }
  }

  void _resetPokemonBuilders() {
    for (var i = 0; i < _pokemonBuilders.length; i++) {
      _pokemonBuilderKeys[i].currentState?.resetValues();
    }
  }

  void _updatePokemonBuilders() async {
    for (var i = 0; i < _pokemonBuilders.length; i++) {
      final pokemonBuilderState = _pokemonBuilderKeys[i].currentState;
      _pokemonBuilders[i] = PokemonBuilder(
        currentGeneration: _currentGeneration,
        key: _pokemonBuilderKeys[i],
      );
      if (pokemonBuilderState != null) {
        pokemonBuilderState.fetchItems();
        pokemonBuilderState.fetchNatures();
      }
    }
  }

  Future<void> _fetchItems() async {
    try {
      List<String> itemList = await _pokeAPIService.fetchItems();
      setState(() {
        _itemList = itemList;
      });
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> _fetchNatures() async {
    try {
      List<String> naturesList = await _pokeAPIService.fetchNatures();
      setState(() {
        _naturesList = naturesList;
      });
    } catch (e) {
      print('Error fetching natures: $e');
    }
  }

  Team buildTeam() {
    List<Pokemon> pokemonList = _pokemonBuilderKeys.map((key) {
      final pokemonBuilderState = key.currentState;
      return pokemonBuilderState != null ? pokemonBuilderState.buildPokemon() : null;
    }).whereType<Pokemon>().toList();

    print('Current trainer name: ${widget.currentTrainer.username}');

    return Team(
      name: 'New Team',
      createdDate: DateTime.now(),
      isPublic: _isPublic,
      numLikes: 0,
      generation: _selectedGeneration == 'All generations'
          ? 0
          : int.parse(_selectedGeneration.split(' ').last),
      pokemon: pokemonList,
      comments: [],
      trainer: widget.currentTrainer,
    );
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
                      if (_pokemonBuilders.length <= index) {
                        _pokemonBuilders.add(
                          PokemonBuilder(
                            currentGeneration: _currentGeneration ?? ['Venusaur', 'Charizard', 'Blastoise'],
                            key: _pokemonBuilderKeys[index],
                          ),
                        );
                      }
                      return _pokemonBuilders[index];
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
                    value: _selectedGeneration,
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
                        _selectedGeneration = value!;
                      });
                      _updateCurrentGeneration(value!);
                    },
                    hint: Text('Generation'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Team newTeam = buildTeam();
                      print(newTeam.toJson());
                      _teamService.addTeam(newTeam);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Save'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      for (GlobalKey<PokemonBuilderState> key in _pokemonBuilderKeys) {
                        key.currentState?.generateRandomPokemon();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Random'),
                  ),
                  SizedBox(width: 20.0),
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
                                  style: TextStyle(color: Constants.white),
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
                  SizedBox(width: 20.0),
                  Row(
                    children: [
                      Checkbox(
                        value: _isPublic,
                        onChanged: (value) {
                          setState(() {
                            _isPublic = value!;
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
