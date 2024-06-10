import 'dart:convert';

import 'package:poketeambuilder/data/models/team.dart';

class Trainer {
  final String username;
  String password;
  String name;
  String firstSurname;
  String secondSurname;
  final String email;
  String phone;
  final DateTime createdDate;
  bool theme;
  String bio;

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
  });

  Trainer.withUsername(this.username)
      : password = '',
        name = '',
        firstSurname = '',
        secondSurname = '',
        email = '',
        phone = '',
        createdDate = DateTime.now(),
        theme = false,
        bio = '';

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
    );
  }

}
