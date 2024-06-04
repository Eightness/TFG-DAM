import 'package:poketeambuilder/data/models/team.dart';

class Trainer {
  final String username;
  final String password;
  final String name;
  final String firstSurname;
  final String secondSurname;
  final String email;
  final String phone;
  final DateTime createdDate;
  final bool theme;
  final String bio;
  final List<Team> teams;

  Trainer({
    required this.name,
    required this.firstSurname,
    required this.secondSurname,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.createdDate,
    required this.theme,
    required this.bio,
    required this.teams,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'firstSurname': firstSurname,
      'secondSurname': secondSurname,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'createdDate': createdDate.toIso8601String(),
      'theme': theme,
      'bio': bio,
      'teams': teams.map((team) => team.toJson()).toList(),
    };
  }
}
