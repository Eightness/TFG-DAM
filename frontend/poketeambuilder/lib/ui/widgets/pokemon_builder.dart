import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poketeambuilder/data/services/pokeapi_service.dart';

import '../../data/models/move.dart';
import '../../data/models/pokemon.dart';
import '../../utils/constants.dart';

class PokemonBuilder extends StatefulWidget {
  final List<String>? currentGeneration;
  final List<String>? items;
  final List<String>? natures;
  final Pokemon? initialPokemon;
  final bool editing;
  final GlobalKey<PokemonBuilderState> key;

  PokemonBuilder({
    required this.currentGeneration,
    required this.key,
    this.items,
    this.natures,
    this.initialPokemon,
    this.editing = false,
  });

  @override
  PokemonBuilderState createState() => PokemonBuilderState();
}

class PokemonBuilderState extends State<PokemonBuilder>
    with AutomaticKeepAliveClientMixin {
  PokeAPIService _pokeAPIService = new PokeAPIService();

  String? _selectedPokemon;
  String? _pokemonSpriteUrl;
  bool _isShiny = false;
  List<String?> _selectedMoves = List.filled(4, null);
  List<String> _movesList = [];
  String? _selectedAbility;
  List<String> _abilitiesList = [];
  String? _selectedItem;
  List<String> _itemList = [];
  String? _selectedNature;
  List<String> _naturesList = [];
  List<int?> _selectedEVs = List.filled(6, null);
  List<int?> _selectedIVs = List.filled(6, null);

  @override
  void initState() {
    super.initState();
    fetchItems();
    fetchNatures();
    if (widget.editing && widget.initialPokemon != null) {
      initializeWithPokemon(widget.initialPokemon!);
    }
  }

  void initializeWithPokemon(Pokemon pokemon) {
    setState(() {
      _selectedPokemon = pokemon.name;
      _pokemonSpriteUrl = pokemon.spriteUrl;
      _isShiny = pokemon.isShiny;
      _selectedAbility = pokemon.ability;
      _selectedItem = pokemon.item;
      _selectedNature = pokemon.nature;
      _selectedMoves = pokemon.moves.map((move) => move.name).toList();
      _selectedEVs = [
        pokemon.evAtk,
        pokemon.evDef,
        pokemon.evSpAtk,
        pokemon.evSpDef,
        pokemon.evSpeed,
        pokemon.evHealth,
      ];
      _selectedIVs = [
        pokemon.ivAtk,
        pokemon.ivDef,
        pokemon.ivSpAtk,
        pokemon.ivSpDef,
        pokemon.ivSpeed,
        pokemon.ivHealth,
      ];
    });
  }

  Future<void> fetchItems() async {
    try {
      List<String> itemList = await _pokeAPIService.fetchItems();
      setState(() {
        _itemList = itemList;
      });
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> fetchNatures() async {
    try {
      List<String> naturesList = await _pokeAPIService.fetchNatures();
      setState(() {
        _naturesList = naturesList;
      });
    } catch (e) {
      print('Error fetching natures: $e');
    }
  }

  void resetValues() {
    setState(() {
      _selectedPokemon = null;
      _pokemonSpriteUrl = null;
      _isShiny = false;
      _selectedMoves = List.filled(4, null);
      _movesList = [];
      _selectedAbility = null;
      _abilitiesList = [];
      _selectedItem = null;
      _itemList = [];
      _selectedNature = null;
      _naturesList = [];
      _selectedEVs = List.filled(6, null);
      _selectedIVs = List.filled(6, null);
    });
  }

  void resetMoves() {
    setState(() {
      _selectedMoves = List.filled(4, null);
    });
  }

  void resetAbilities() {
    setState(() {
      _selectedAbility = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Constants.white, Constants.grey.withOpacity(0.3)],
        ),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // First Column
          SizedBox(
            width: 130.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: _selectedPokemon,
                  items: _buildDropdownItems(widget.currentGeneration),
                  onChanged: (value) async {
                    setState(() {
                      _selectedPokemon = value;
                    });
                    resetMoves();
                    resetAbilities();
                    final spriteUrl = await _pokeAPIService.fetchPokemonSprite(
                      _selectedPokemon!,
                      _isShiny,
                    );
                    final movesList = await _pokeAPIService.fetchPokemonMoves(
                      _selectedPokemon!,
                    );
                    final abilitiesList = await _pokeAPIService
                        .fetchPokemonAbilities(_selectedPokemon!);
                    setState(() {
                      _pokemonSpriteUrl = spriteUrl;
                      _movesList = movesList;
                      _abilitiesList = abilitiesList;
                    });
                  },
                  hint: const Text('Pokémon'),
                ),
                const SizedBox(height: 45.0),
                Image.network(
                  _pokemonSpriteUrl != null
                      ? _pokemonSpriteUrl!
                      : 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/f720bb6e-b303-4877-bffb-d61df0ab183f/d3b98cf-4fc5c76b-2a99-47fc-98b6-d7d4ee8d9d9f.png',
                  height: 90.0,
                  width: 90.0,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Constants.white,
                      value: _isShiny,
                      onChanged: _selectedPokemon == null
                          ? null
                          : (value) async {
                              setState(() {
                                _isShiny = value ?? false;
                              });
                              final spriteUrl =
                                  await _pokeAPIService.fetchPokemonSprite(
                                      _selectedPokemon!, _isShiny);
                              setState(() {
                                _pokemonSpriteUrl = spriteUrl;
                              });
                            },
                    ),
                    Text('Shiny'),
                  ],
                ),
                const SizedBox(height: 5.0),
                DropdownButton<String>(
                  value: _selectedNature,
                  items: _buildDropdownItems(_naturesList),
                  onChanged: (value) {
                    setState(() {
                      _selectedNature = value;
                    });
                  },
                  hint: const Text('Nature'),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          // Second Column
          SizedBox(
            width: 165.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: _selectedItem,
                  items: _buildDropdownItems(_itemList),
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                  hint: const Text('Item'),
                ),
                DropdownButton<String>(
                  value: _selectedAbility,
                  items: _buildDropdownItems(_abilitiesList),
                  onChanged: (value) {
                    setState(() {
                      _selectedAbility = value;
                    });
                  },
                  hint: const Text('Ability'),
                ),
                for (int i = 1; i <= 4; i++)
                  DropdownButton<String>(
                    value: _selectedMoves[i - 1],
                    items: _buildDropdownItems(_movesList),
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
          SizedBox(width: 10.0),
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
                    SizedBox(
                        width: 60.0, child: _buildStatInput('EV', 252, index)),
                    const SizedBox(width: 8.0),
                    SizedBox(
                        width: 60.0, child: _buildStatInput('IV', 31, index)),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<String>? options) {
    return options?.map((option) {
          return DropdownMenuItem(value: option, child: Text(option));
        }).toList() ??
        [];
  }

  Widget _buildStatInput(String label, int maxValue, int index) {
    final controller = TextEditingController();
    controller.text = label == 'EV'
        ? (_selectedEVs[index]?.toString() ?? '')
        : (_selectedIVs[index]?.toString() ?? '');

    return SizedBox(
      width: 60.0,
      child: TextFormField(
        controller: controller,
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

  Pokemon buildPokemon() {
    return Pokemon(
      name: _selectedPokemon ?? 'Empty slot',
      spriteUrl: _pokemonSpriteUrl ?? '',
      item: _selectedItem ?? 'None',
      ability: _selectedAbility ?? 'None',
      nature: _selectedNature ?? 'None',
      isShiny: _isShiny,
      moves: _selectedMoves
          .where((move) => move != null)
          .map((move) => Move(name: move!))
          .toList(),
      ivDef: _selectedIVs[0] ?? 0,
      ivAtk: _selectedIVs[1] ?? 0,
      ivSpDef: _selectedIVs[2] ?? 0,
      ivSpAtk: _selectedIVs[3] ?? 0,
      ivSpeed: _selectedIVs[4] ?? 0,
      ivHealth: _selectedIVs[5] ?? 0,
      evDef: _selectedEVs[0] ?? 0,
      evAtk: _selectedEVs[1] ?? 0,
      evSpDef: _selectedEVs[2] ?? 0,
      evSpAtk: _selectedEVs[3] ?? 0,
      evSpeed: _selectedEVs[4] ?? 0,
      evHealth: _selectedEVs[5] ?? 0,
    );
  }

  Future<void> generateRandomPokemon() async {
    final random = Random();
    final randomPokemonName = widget
        .currentGeneration?[random.nextInt(widget.currentGeneration!.length)];

    try {
      final spriteUrlFuture =
          _pokeAPIService.fetchPokemonSprite(randomPokemonName!, _isShiny);
      final movesListFuture =
          _pokeAPIService.fetchPokemonMoves(randomPokemonName);
      final abilitiesListFuture =
          _pokeAPIService.fetchPokemonAbilities(randomPokemonName);
      final naturesListFuture = _pokeAPIService.fetchNatures();
      final itemsListFuture = _pokeAPIService.fetchItems();

      final results = await Future.wait([
        abilitiesListFuture,
        spriteUrlFuture,
        movesListFuture,
        naturesListFuture,
        itemsListFuture,
      ]);

      final abilitiesList = results[0] as List<String>?;
      final spriteUrl = results[1] as String?;
      final movesList = results[2] as List<String>?;
      final naturesList = results[3] as List<String>?;
      final itemsList = results[4] as List<String>?;

      setState(() {
        _selectedPokemon = randomPokemonName;
        _pokemonSpriteUrl = spriteUrl;
        _selectedItem = itemsList?[random.nextInt(itemsList.length)];
        _abilitiesList = abilitiesList!;
        _selectedAbility = abilitiesList?[random.nextInt(abilitiesList.length)];
        _selectedNature = naturesList?[random.nextInt(naturesList.length)];
        _movesList = movesList!;
        _isShiny = false;
        _selectedMoves = List.generate(
            4, (_) => movesList![random.nextInt(movesList.length)]);
        _selectedIVs = List.generate(6, (_) => random.nextInt(32));
        _selectedEVs = List.generate(6, (_) => random.nextInt(253));
      });
    } catch (e) {
      print('Error generating random Pokemon: $e');
      throw Exception('Failed to generate random Pokemon: $e');
    }
  }

  @override
  bool get wantKeepAlive => true;
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
