import 'dart:convert';

import 'package:poketeambuilder/data/models/trainer.dart';

class Comment {
  final DateTime createdDate;
  final String body;
  final Trainer trainer;

  Comment({
    required this.createdDate,
    required this.trainer,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate.toIso8601String(),
      'body': body,
      'trainer': trainer.toJson(),
    };
  }

  factory Comment.fromJson(String json) {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;

    return Comment(
      createdDate: DateTime.parse(decodedJson['createdDate'] as String),
      body: decodedJson['body'] as String,
      trainer: Trainer.fromJson(decodedJson['trainer'] as String),
    );
  }
}
