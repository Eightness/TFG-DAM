import 'dart:convert';

import 'package:poketeambuilder/data/models/team.dart';
import 'package:poketeambuilder/data/models/trainer.dart';

class Comment {
  final DateTime createdDate;
  final String body;
  final Trainer trainer;
  final Team team;

  Comment({
    required this.createdDate,
    required this.trainer,
    required this.body,
    required this.team,
  });

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate.toIso8601String(),
      'body': body,
      'trainer': trainer.toJson(),
      'team': {
        'name': team.name,
        'trainer': team.trainer.toJson(),
      },
    };
  }

  factory Comment.fromJson(String json) {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;

    final createdDate = DateTime.parse(decodedJson['createdDate'] as String);
    final body = decodedJson['body'] as String;
    final trainerUsername = decodedJson['trainer']['username'] as String;
    final teamName = decodedJson['team']['name'] as String;
    return Comment(
      createdDate: createdDate,
      body: body,
      trainer: Trainer.withUsername(trainerUsername),
      team: Team.withName(teamName),
    );
  }
}
