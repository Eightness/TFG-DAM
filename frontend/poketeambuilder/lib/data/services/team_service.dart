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
          firstTrainer =
              Trainer.fromJson(jsonEncode(jsonResponse[0]['trainer']));
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
              isShiny: pokemonJson['isShiny'] as bool,
            );
            pokemonList.add(pokemon);
          }

          Team team = Team(
            name: teamJson['name'],
            createdDate: DateTime.parse(teamJson['createdDate']),
            isPublic: teamJson['isPublic'] as bool,
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

  Future<List<Team>?> getPublicTeamsByTrainerUsername(String username) async {
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
          firstTrainer =
              Trainer.fromJson(jsonEncode(jsonResponse[0]['trainer']));
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
              isShiny: pokemonJson['isShiny'],
            );
            pokemonList.add(pokemon);
          }

          Team team = Team(
            name: teamJson['name'],
            createdDate: DateTime.parse(teamJson['createdDate']),
            isPublic: teamJson['isPublic'] as bool,
            numLikes: teamJson['numLikes'] as int,
            generation: teamJson['generation'] as int,
            pokemon: pokemonList,
            comments: [],
            trainer: firstTrainer,
          );

          if (team.isPublic == true) {
            teams.add(team);
          }
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
          if (teamJson == null) {
            print('Warning: teamJson is null');
            continue;
          }

          List<Pokemon> pokemonList = [];
          if (teamJson['pokemon'] != null) {
            for (var pokemonJson in teamJson['pokemon']) {
              if (pokemonJson == null) {
                print('Warning: pokemonJson is null');
                continue;
              }
              Pokemon pokemon = Pokemon(
                name: pokemonJson['name'] ?? 'Unknown',
                spriteUrl: pokemonJson['spriteUrl'] ?? '',
                item: pokemonJson['item'] ?? '',
                ability: pokemonJson['ability'] ?? '',
                nature: pokemonJson['nature'] ?? '',
                moves: [],
                ivDef: pokemonJson['ivDef'] ?? 0,
                ivAtk: pokemonJson['ivAtk'] ?? 0,
                ivSpDef: pokemonJson['ivSpDef'] ?? 0,
                ivSpAtk: pokemonJson['ivSpAtk'] ?? 0,
                ivSpeed: pokemonJson['ivSpeed'] ?? 0,
                ivHealth: pokemonJson['ivHealth'] ?? 0,
                evDef: pokemonJson['evDef'] ?? 0,
                evAtk: pokemonJson['evAtk'] ?? 0,
                evSpDef: pokemonJson['evSpDef'] ?? 0,
                evSpAtk: pokemonJson['evSpAtk'] ?? 0,
                evSpeed: pokemonJson['evSpeed'] ?? 0,
                evHealth: pokemonJson['evHealth'] ?? 0,
                isShiny: pokemonJson['isShiny'] ?? false,
              );
              pokemonList.add(pokemon);
            }
          }

          // Mapping the Trainer details
          Trainer trainer = Trainer(
            name: teamJson['trainer']?['name'] ?? '',
            firstSurname: teamJson['trainer']?['firstSurname'] ?? '',
            secondSurname: teamJson['trainer']?['secondSurname'] ?? '',
            email: teamJson['trainer']?['email'] ?? '',
            phone: teamJson['trainer']?['phone'] ?? '',
            username: teamJson['trainer']?['username'] ?? '',
            password: teamJson['trainer']?['password'] ?? '',
            createdDate: teamJson['trainer']?['createdDate'] != null
                ? DateTime.parse(teamJson['trainer']['createdDate'])
                : DateTime.now(),
            theme: teamJson['trainer']?['theme'] ?? false,
            bio: teamJson['trainer']?['bio'] ?? '',
          );

          Team team = Team(
            name: teamJson['name'] ?? 'Unknown',
            createdDate: teamJson['createdDate'] != null
                ? DateTime.parse(teamJson['createdDate'])
                : DateTime.now(),
            isPublic: teamJson['isPublic'] ?? false,
            numLikes: teamJson['numLikes'] ?? 0,
            generation: teamJson['generation'] ?? 0,
            pokemon: pokemonList,
            comments: [],
            trainer: trainer,
          );

          if (team.isPublic == true) {
            teams.add(team);
          }
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

  Future<void> deleteTeam(String teamName, String trainerUsername) async {
    final url = Uri.parse('$baseUrl/delete/$teamName/$trainerUsername');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Team deleted successfully');
    } else {
      throw Exception('Failed to delete team');
    }
  }

  Future<bool> teamExists(String trainerUsername, String teamName) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/check/$teamName/$trainerUsername'));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['exists'] ?? false;
      } else {
        throw Exception(
            'Failed to check team existence: ${response.statusCode}');
      }
    } catch (e) {
      print('Error checking team existence: $e');
      return false;
    }
  }

  Future<Team> likeTeam(Team team) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/like'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(team.toJson()),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Team.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to like team: ${response.statusCode}');
      }
    } catch (e) {
      print('Error liking team: $e');
      rethrow;
    }
  }

  Future<Team> dislikeTeam(Team team) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/dislike'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(team.toJson()),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Team.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to dislike team: ${response.statusCode}');
      }
    } catch (e) {
      print('Error disliking team: $e');
      rethrow;
    }
  }

  Future<List<Team>> getTeamsWithComments() async {
    final response = await http.get(
      Uri.parse('$baseUrl/teams-with-comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      List<Team> teams = [];

      for (var teamJson in jsonResponse) {
        if (teamJson == null) {
          print('Warning: teamJson is null');
          continue;
        }

        List<Pokemon> pokemonList = [];
        if (teamJson['pokemon'] != null) {
          for (var pokemonJson in teamJson['pokemon']) {
            if (pokemonJson == null) {
              print('Warning: pokemonJson is null');
              continue;
            }
            Pokemon pokemon = Pokemon(
              name: pokemonJson['name'] ?? 'Unknown',
              spriteUrl: pokemonJson['spriteUrl'] ?? '',
              item: pokemonJson['item'] ?? '',
              ability: pokemonJson['ability'] ?? '',
              nature: pokemonJson['nature'] ?? '',
              moves: [],
              ivDef: pokemonJson['ivDef'] ?? 0,
              ivAtk: pokemonJson['ivAtk'] ?? 0,
              ivSpDef: pokemonJson['ivSpDef'] ?? 0,
              ivSpAtk: pokemonJson['ivSpAtk'] ?? 0,
              ivSpeed: pokemonJson['ivSpeed'] ?? 0,
              ivHealth: pokemonJson['ivHealth'] ?? 0,
              evDef: pokemonJson['evDef'] ?? 0,
              evAtk: pokemonJson['evAtk'] ?? 0,
              evSpDef: pokemonJson['evSpDef'] ?? 0,
              evSpAtk: pokemonJson['evSpAtk'] ?? 0,
              evSpeed: pokemonJson['evSpeed'] ?? 0,
              evHealth: pokemonJson['evHealth'] ?? 0,
              isShiny: pokemonJson['isShiny'] ?? false,
            );
            pokemonList.add(pokemon);
          }
        }

        // Mapping the Trainer details
        Trainer trainer = Trainer(
          name: teamJson['trainer']?['name'] ?? '',
          firstSurname: teamJson['trainer']?['firstSurname'] ?? '',
          secondSurname: teamJson['trainer']?['secondSurname'] ?? '',
          email: teamJson['trainer']?['email'] ?? '',
          phone: teamJson['trainer']?['phone'] ?? '',
          username: teamJson['trainer']?['username'] ?? '',
          password: teamJson['trainer']?['password'] ?? '',
          createdDate: teamJson['trainer']?['createdDate'] != null
              ? DateTime.parse(teamJson['trainer']['createdDate'])
              : DateTime.now(),
          theme: teamJson['trainer']?['theme'] ?? false,
          bio: teamJson['trainer']?['bio'] ?? '',
        );

        Team team = Team(
          name: teamJson['name'] ?? 'Unknown',
          createdDate: teamJson['createdDate'] != null
              ? DateTime.parse(teamJson['createdDate'])
              : DateTime.now(),
          isPublic: teamJson['isPublic'] ?? false,
          numLikes: teamJson['numLikes'] ?? 0,
          generation: teamJson['generation'] ?? 0,
          pokemon: pokemonList,
          comments: [],
          trainer: trainer,
        );

        if (team.isPublic == true) {
          teams.add(team);
        }
      }

      print('Status code: ${response.statusCode}');
      return teams;
    } else {
      print('Failed to retrieve teams');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }
}
