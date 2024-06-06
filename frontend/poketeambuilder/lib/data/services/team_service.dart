import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poketeambuilder/data/models/team.dart';

import '../models/pokemon.dart';
import '../models/trainer.dart';

class TeamService {
  final String baseUrl = 'http://localhost:9090/team';

  Future<http.Response> _post(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> _get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.get(url);
  }

  Future<http.Response> _put(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> _delete(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<bool> addTeam(Team team) async {
    try {
      final response = await _post('add', team.toJson());
      return true;
    } catch (e) {
      print('Error adding team: $e');
      return false;
    }
  }

  // Get teams from trainer's username
  Future<List<Team>?> getTeamsByTrainerUsername(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/trainer/$username'),
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        Trainer firstTrainer = Trainer(
          username: '',
          password: '',
          name: '',
          firstSurname: '',
          secondSurname: '',
          email: '',
          phone: '',
          createdDate: DateTime.now(),
          theme: false,
          bio: '',
        );

        if (jsonResponse.isNotEmpty && jsonResponse[0]['trainer'] != null) {
          firstTrainer = Trainer.fromJson(jsonEncode(jsonResponse[0]['trainer']));
        }

        List<Team> teams = [];

        for (var teamJson in jsonResponse) {
          List<Pokemon> pokemonList = [];
          for (var pokemonJson in teamJson['pokemon']) {
            Pokemon pokemon = Pokemon(
              name: pokemonJson['name'],
              spriteUrl: pokemonJson['spriteUrl'],
              item: pokemonJson['item'],
              ability: pokemonJson['ability'],
              nature: pokemonJson['nature'],
              moves: [],
              ivDef: pokemonJson['ivDef'],
              ivAtk: pokemonJson['ivAtk'],
              ivSpDef: pokemonJson['ivSpDef'],
              ivSpAtk: pokemonJson['ivSpAtk'],
              ivSpeed: pokemonJson['ivSpeed'],
              ivHealth: pokemonJson['ivHealth'],
              evDef: pokemonJson['evDef'],
              evAtk: pokemonJson['evAtk'],
              evSpDef: pokemonJson['evSpDef'],
              evSpAtk: pokemonJson['evSpAtk'],
              evSpeed: pokemonJson['evSpeed'],
              evHealth: pokemonJson['evHealth'],
              isShiny: pokemonJson['shiny'],
            );
            pokemonList.add(pokemon);
          }

          Team team = Team(
            name: teamJson['name'],
            createdDate: DateTime.parse(teamJson['createdDate']),
            public: teamJson['public'] as bool,
            numLikes: teamJson['numLikes'] as int,
            generation: teamJson['generation'] as int,
            pokemon: pokemonList,
            comments: [],
            trainer: firstTrainer,
          );

          teams.add(team);
        }

        print('Status code: ${response.statusCode}');
        return teams;
      } else {
        print('Failed to retrieve team from trainer with username $username');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching team from trainer with username $username: $e');
      return null;
    }
  }

  // Get teams from trainer's username
  Future<List<Team>> getAllPublicTeams() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/get-all'),
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        List<Team> teams = [];

        for (var teamJson in jsonResponse) {
          List<Pokemon> pokemonList = [];
          for (var pokemonJson in teamJson['pokemon']) {
            Pokemon pokemon = Pokemon(
              name: pokemonJson['name'],
              spriteUrl: pokemonJson['spriteUrl'],
              item: pokemonJson['item'],
              ability: pokemonJson['ability'],
              nature: pokemonJson['nature'],
              moves: [],
              ivDef: pokemonJson['ivDef'],
              ivAtk: pokemonJson['ivAtk'],
              ivSpDef: pokemonJson['ivSpDef'],
              ivSpAtk: pokemonJson['ivSpAtk'],
              ivSpeed: pokemonJson['ivSpeed'],
              ivHealth: pokemonJson['ivHealth'],
              evDef: pokemonJson['evDef'],
              evAtk: pokemonJson['evAtk'],
              evSpDef: pokemonJson['evSpDef'],
              evSpAtk: pokemonJson['evSpAtk'],
              evSpeed: pokemonJson['evSpeed'],
              evHealth: pokemonJson['evHealth'],
              isShiny: pokemonJson['shiny'],
            );
            pokemonList.add(pokemon);
          }

          // Mapping the Trainer details
          Trainer trainer = Trainer(
            name: teamJson['trainer']['name'],
            firstSurname: teamJson['trainer']['firstSurname'],
            secondSurname: teamJson['trainer']['secondSurname'],
            email: teamJson['trainer']['email'],
            phone: teamJson['trainer']['phone'],
            username: teamJson['trainer']['username'],
            password: teamJson['trainer']['password'],
            createdDate: DateTime.parse(teamJson['trainer']['createdDate']),
            theme: teamJson['trainer']['theme'],
            bio: teamJson['trainer']['bio'],
          );

          Team team = Team(
            name: teamJson['name'],
            createdDate: DateTime.parse(teamJson['createdDate']),
            public: teamJson['public'] as bool,
            numLikes: teamJson['numLikes'] as int,
            generation: teamJson['generation'] as int,
            pokemon: pokemonList,
            comments: [], // Assuming comments are empty for now
            trainer: trainer,
          );

          teams.add(team);
        }

        print('Status code: ${response.statusCode}');
        return teams;
      } else {
        print('Failed to retrieve teams');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error fetching teams: $e');
      return [];
    }
  }


}
