import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/pokemon.dart';
import 'package:poketeambuilder/data/models/team.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/data/services/trainer_service.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/services/pokeapi_service.dart';
import '../../widgets/pokemon_builder.dart';

class TeamBuilder extends StatefulWidget {
  final Trainer currentTrainer;

  TeamBuilder({Key? key, required this.currentTrainer}) : super(key: key);

  @override
  _TeamBuilderState createState() => _TeamBuilderState();
}

class _TeamBuilderState extends State<TeamBuilder> {
  String _selectedGeneration = 'All generations';
  List<String>? _currentGeneration;
  bool _isPublic = true;
  final PokeAPIService _pokeAPIService = PokeAPIService();
  final TeamService _teamService = TeamService();
  final TrainerService _trainerService = TrainerService();
  late final List<String>? _itemList;
  late final List<String>? _naturesList;
  final TextEditingController _teamNameController = TextEditingController();
  List<GlobalKey<PokemonBuilderState>> _pokemonBuilderKeys = List.generate(
    6,
        (_) => GlobalKey<PokemonBuilderState>(),
  );
  List<PokemonBuilder> _pokemonBuilders = [];
  List<Team> _trainerTeams = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
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
      loadTrainerTeams();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoading = false;
      });
    }
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

  Future<void> loadTrainerTeams() async {
    try {
      List<Team>? trainerTeams = await _teamService.getTeamsByTrainerUsername(widget.currentTrainer.username);

      if (trainerTeams != null) {
        setState(() {
          _trainerTeams = trainerTeams;
        });
      }
    } catch (e) {
      print("Error loading trainer data: $e");
    }
  }

  bool checkTrainerTeamsNames(String teamName) {
    bool teamNameExists = false;

    for (Team team in _trainerTeams) {
      if (team.name == teamName) {
        teamNameExists = true;
      }
    }

    return teamNameExists;
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

  Future<void> _showSaveDialog() async {
    await loadTrainerTeams();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Team'),
          content: TextField(
            controller: _teamNameController,
            decoration: const InputDecoration(
              hintText: 'Enter team name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Constants.red),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save', style: TextStyle(color: Constants.red),),
              onPressed: () async {
                final teamName = _teamNameController.text.trim();
                if (teamName.isNotEmpty) {
                  bool teamExists = checkTrainerTeamsNames(teamName);
                  if (teamExists) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Team Already Exists'),
                          content: Text('A team with the name "$teamName" already exists for this trainer.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK', style: TextStyle(color: Constants.red),),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Team newTeam = buildTeam(teamName);
                    List<Pokemon> pokemonFromTeam = newTeam.getPokemonList();

                    int numPokemon = 0;

                    for (Pokemon pokemon in pokemonFromTeam) {
                      if (pokemon.name != 'Empty slot') {
                        numPokemon++;
                      }
                    }

                    if (numPokemon > 0) {
                      _teamService.addTeam(newTeam);
                      _resetPokemonBuilders();
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Empty Team'),
                            content: Text('You cannot save an empty team. Please add at least one Pokémon.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK', style: TextStyle(color: Constants.red)),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }


  Team buildTeam(String name) {
    List<Pokemon> pokemonList = _pokemonBuilderKeys.map((key) {
      final pokemonBuilderState = key.currentState;
      return pokemonBuilderState != null ? pokemonBuilderState.buildPokemon() : null;
    }).whereType<Pokemon>().toList();

    print('Current trainer name: ${widget.currentTrainer.username}');

    return Team(
      name: name,
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
      child: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Constants.red,
        ),
      )
          : Padding(
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
                      _showSaveDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Text('Save'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () async {
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
