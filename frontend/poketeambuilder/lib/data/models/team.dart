import 'package:poketeambuilder/data/models/pokemon.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/models/comment.dart';

class Team {
  final String name;
  final DateTime createdDate;
  final bool isPublic;
  final int numLikes;
  final String generation;
  final List<Pokemon> pokemon;
  final List<Comment> comments;
  final Trainer trainer;

  Team(
      this.comments, {
        required this.isPublic,
        required this.numLikes,
        required this.generation,
        required this.pokemon,
        required this.trainer,
        required this.name,
        required this.createdDate,
      });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdDate': createdDate.toIso8601String(),
      'isPublic': isPublic,
      'numLikes': numLikes,
      'generation': generation,
      'pokemon': pokemon.map((pokemon) => pokemon.toJson()).toList(),
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'trainer': trainer.toJson(),
    };
  }
}
