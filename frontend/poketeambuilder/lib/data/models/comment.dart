import 'dart:convert';

import 'package:poketeambuilder/data/models/trainer.dart';

class Comment {
  final DateTime createdDate;
  final String body;
  final Trainer trainer;

  Comment(
      this.createdDate,
      this.trainer, {
        required this.body,
      });

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate.toIso8601String(),
      'body': body,
      'trainer': trainer.toJson(),
    };
  }
}
