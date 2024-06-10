import 'dart:convert';

import 'package:poketeambuilder/data/models/pokemon.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/models/comment.dart';

class Team {
  final String name;
  final DateTime createdDate;
  final bool isPublic;
  final int numLikes;
  final int generation;
  final List<Pokemon> pokemon;
  final List<Comment> comments;
  final Trainer trainer;

  Team({
        required this.isPublic,
        required this.numLikes,
        required this.generation,
        required this.pokemon,
        required this.trainer,
        required this.name,
        required this.createdDate,
        required this.comments,
      });

  Team.withName(this.name)
      : createdDate = DateTime.now(),
        isPublic = false,
        numLikes = 0,
        generation = 0,
        pokemon = [],
        comments = [],
        trainer = Trainer.withUsername('');

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

  factory Team.fromJson(String json) {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;

    return Team(
      comments: (decodedJson['comments'] as List<dynamic>)
          .map((commentJson) => Comment.fromJson(jsonEncode(commentJson)))
          .toList(),
      name: decodedJson['name'] as String,
      createdDate: DateTime.parse(decodedJson['createdDate'] as String),
      isPublic: decodedJson['isPublic'] as bool,
      numLikes: decodedJson['numLikes'] as int,
      generation: decodedJson['generation'] as int,
      pokemon: (decodedJson['pokemon'] as List<dynamic>)
          .map((pokemonJson) => Pokemon.fromJson(jsonEncode(pokemonJson)))
          .toList(),
      trainer: Trainer.fromJson(decodedJson['trainer'] as String),
    );
  }

  List<Pokemon> getPokemonList() {
    return pokemon;
  }

  @override
  String toString() {
    final pokemonList = pokemon.map((p) => p.name).join(', ');
    return 'Team(name: $name, createdDate: $createdDate, isPublic: $isPublic, numLikes: $numLikes, generation: $generation, trainer: ${trainer.username}, pokemon: [$pokemonList])';
  }

}
