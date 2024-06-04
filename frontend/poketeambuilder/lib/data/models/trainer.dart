import 'dart:convert';

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

  factory Trainer.fromJson(String json) {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;

    return Trainer(
      name: decodedJson['name'] as String,
      firstSurname: decodedJson['firstSurname'] as String,
      secondSurname: decodedJson['secondSurname'] as String,
      email: decodedJson['email'] as String,
      phone: decodedJson['phone'] as String,
      username: decodedJson['username'] as String,
      password: decodedJson['password'] as String,
      createdDate: DateTime.parse(decodedJson['createdDate'] as String),
      theme: decodedJson['theme'] as bool,
      bio: decodedJson['bio'] as String,
      teams: (decodedJson['teams'] as List<dynamic>)
          .map((teamJson) => Team.fromJson(jsonEncode(teamJson)))
          .toList(),
    );
  }

}
