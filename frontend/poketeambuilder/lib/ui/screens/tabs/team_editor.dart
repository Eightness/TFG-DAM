import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/pokemon.dart';
import 'package:poketeambuilder/data/models/team.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/data/services/trainer_service.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/services/pokeapi_service.dart';
import '../../widgets/pokemon_builder.dart';

class TeamEditor extends StatefulWidget {
  final Team selectedTeam;
  final Trainer currentTrainer;

  TeamEditor({Key? key, required this.selectedTeam, required this.currentTrainer})
      : super(key: key);

  @override
  _TeamEditorState createState() => _TeamEditorState();
}

class _TeamEditorState extends State<TeamEditor> {
  late String _selectedGeneration;
  late List<String> _currentGeneration;
  late bool _isPublic;
  final PokeAPIService _pokeAPIService = PokeAPIService();
  final TeamService _teamService = TeamService();
  final TrainerService _trainerService = TrainerService();
  late List<String> _itemList;
  late List<String> _naturesList;
  final TextEditingController _teamNameController = TextEditingController();
  late List<GlobalKey<PokemonBuilderState>> _pokemonBuilderKeys;
  late List<PokemonBuilder> _pokemonBuilders;
  List<Team> _trainerTeams = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedGeneration = 'All generations';
    _currentGeneration =
        widget.selectedTeam.pokemon.map((pokemon) => pokemon.name).toList();
    _isPublic = widget.selectedTeam.isPublic;
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _fetchItems();
      _fetchNatures();
      _pokemonBuilderKeys = List.generate(
        6,
        (_) => GlobalKey<PokemonBuilderState>(),
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

  Future<void> loadTrainerTeams() async {
    try {
      List<Team>? trainerTeams = await _teamService
          .getTeamsByTrainerUsername(widget.currentTrainer.username);

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
    return _trainerTeams.any((team) => team.name == teamName);
  }

  Future<void> _showEditDialog() async {
    await loadTrainerTeams();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Team'),
          content: TextField(
            controller: _teamNameController..text = widget.selectedTeam.name,
            decoration: const InputDecoration(
              hintText: 'Enter team name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Constants.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Edit',
                style: TextStyle(color: Constants.red),
              ),
              onPressed: () async {
                final teamName = _teamNameController.text.trim();
                if (teamName.isNotEmpty) {
                  if (teamName != widget.selectedTeam.name &&
                      checkTrainerTeamsNames(teamName)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Team Already Exists'),
                          content: Text(
                              'A team with the name "$teamName" already exists for this trainer.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: Constants.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Team editedTeam = buildTeam(teamName);
                    //_teamService.editTeam(widget.team, editedTeam);
                    Navigator.of(context).pop();
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
    List<Pokemon> pokemonList = _pokemonBuilderKeys
        .map((key) {
          final pokemonBuilderState = key.currentState;
          return pokemonBuilderState != null
              ? pokemonBuilderState.buildPokemon()
              : null;
        })
        .whereType<Pokemon>()
        .toList();

    return Team(
      name: name,
      createdDate: widget.selectedTeam.createdDate,
      isPublic: _isPublic,
      numLikes: widget.selectedTeam.numLikes,
      generation: _selectedGeneration == 'All generations'
          ? 0
          : int.parse(_selectedGeneration.split(' ').last),
      pokemon: pokemonList,
      comments: widget.selectedTeam.comments,
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                  currentGeneration: _currentGeneration,
                                  initialPokemon: widget.selectedTeam.pokemon[index],
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
                            //_updateCurrentGeneration(value!);
                          },
                          hint: Text('Generation'),
                        ),
                        SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _showEditDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Constants.white,
                            backgroundColor: Constants.red,
                          ),
                          child: Text('Edit'),
                        ),
                        SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            for (GlobalKey<PokemonBuilderState> key
                                in _pokemonBuilderKeys) {
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
                                    child: Image.asset(
                                        'assets/images/typechart.png',
                                        fit: BoxFit.contain),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        'Close',
                                        style:
                                            TextStyle(color: Constants.white),
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