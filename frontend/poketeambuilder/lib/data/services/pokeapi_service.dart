import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeAPIService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2/';

  // Get Pokémon Sprite from Pokémon name
  Future<String> fetchPokemonSprite(String pokemonName, bool isShiny) async {
    if (isShiny) {
      try {
        final response = await http.get(Uri.parse('$_baseUrl/pokemon/${pokemonName.toLowerCase()}'));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data['sprites']['front_shiny'];
        } else {
          throw Exception('Failed to load Pokémon sprite: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching Pokémon sprite: $e');
        throw Exception('Failed to load Pokémon sprite: $e');
      }
    } else {
      try {
        final response = await http.get(Uri.parse('$_baseUrl/pokemon/${pokemonName.toLowerCase()}'));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data['sprites']['front_default'];
        } else {
          throw Exception('Failed to load Pokémon sprite: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching Pokémon sprite: $e');
        throw Exception('Failed to load Pokémon sprite: $e');
      }
    }
  }

  // Get Pokémon moves from Pokémon name
  Future<List<String>> fetchPokemonMoves(String pokemonName) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/pokemon/${pokemonName.toLowerCase()}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> movesData = data['moves'];
        List<String> movesList = movesData.map((move) => formatName(move['move']['name'])).toList();
        return movesList;
      } else {
        throw Exception('Failed to load Pokémon moves');
      }
    } catch (e) {
      print('Error fetching Pokémon moves: $e');
      throw Exception('Failed to load Pokémon moves: $e');
    }
  }

  // Get Pokémon abilities from Pokémon name
  Future<List<String>> fetchPokemonAbilities(String pokemonName) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/pokemon/${pokemonName.toLowerCase()}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> abilitiesData = data['abilities'];
        List<String> abilitiesList = abilitiesData.map((ability) => formatName(ability['ability']['name'])).toList();
        return abilitiesList;
      } else {
        throw Exception('Failed to load Pokémon abilities: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Pokémon abilities: $e');
      throw Exception('Failed to load Pokémon abilities: $e');
    }
  }

  // Get Pokémon items
  Future<List<String>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/item-category/12/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> itemList = data['items'];
        List<String> items = itemList.map((item) => formatName(item['name'])).toList();
        return items;
      } else {
        throw Exception('Failed to load item options: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching item options: $e');
      throw Exception('Failed to load item options: $e');
    }
  }


  // Get Pokémon natures
  Future<List<String>> fetchNatures() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/nature'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> natureList = data['results'];
        List<String> natures = natureList.map((nature) => formatName(nature['name'])).toList();
        return natures;
      } else {
        throw Exception('Failed to load natures: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching natures: $e');
      throw Exception('Failed to load natures: $e');
    }
  }

  Future<List<String>> fetchPokemonNamesByGeneration(int generation) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/generation/$generation'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> pokemonSpeciesList = data['pokemon_species'];
        List<String> pokemonNames = pokemonSpeciesList
            .map((species) => formatName(species['name']))
            .toList();
        return pokemonNames;
      } else {
        throw Exception('Failed to load Pokémon names for generation: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Pokémon names: $e');
      throw Exception('Failed to load Pokémon names: $e');
    }
  }

  // Get all Pokémon names
  Future<List<String>> fetchAllPokemonNames() async {
    try {
      List<String> allPokemonNames = [];

      for (int generation = 1; generation <= 9; generation++) {
        final response = await http.get(Uri.parse('$_baseUrl/generation/$generation/'));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          List<dynamic> species = data['pokemon_species'];
          List<String> generationPokemonNames = species.map((pokemon) => formatName(pokemon['name'])).toList();
          allPokemonNames.addAll(generationPokemonNames);
        } else {
          throw Exception('Failed to load Pokémon names for generation $generation: ${response.statusCode}');
        }
      }

      allPokemonNames = allPokemonNames.toSet().toList();

      return allPokemonNames;
    } catch (e) {
      print('Error fetching Pokémon names: $e');
      throw Exception('Failed to load Pokémon names: $e');
    }
  }

  // Custom data format
  String formatName(String name) {
    return name.split('-').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

}