import 'move.dart';

class Pokemon {
  final String name;
  final String spriteUrl;
  final String item;
  final String ability;
  final String nature;
  final bool isShiny;
  final List<Move> moves;

  // Statistics
  final int ivDef;
  final int ivAtk;
  final int ivSpDef;
  final int ivSpAtk;
  final int ivSpeed;
  final int ivHealth;
  final int evDef;
  final int evAtk;
  final int evSpDef;
  final int evSpAtk;
  final int evSpeed;
  final int evHealth;

  Pokemon({
    required this.name,
    required this.spriteUrl,
    required this.item,
    required this.ability,
    required this.nature,
    required this.isShiny,
    required this.moves,
    required this.ivDef,
    required this.ivAtk,
    required this.ivSpDef,
    required this.ivSpAtk,
    required this.ivSpeed,
    required this.ivHealth,
    required this.evDef,
    required this.evAtk,
    required this.evSpDef,
    required this.evSpAtk,
    required this.evSpeed,
    required this.evHealth,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'spriteUrl': spriteUrl,
      'item': item,
      'ability': ability,
      'nature': nature,
      'isShiny': isShiny,
      'moves': moves.map((move) => move.toJson()).toList(),
      'ivDef': ivDef,
      'ivAtk': ivAtk,
      'ivSpDef': ivSpDef,
      'ivSpAtk': ivSpAtk,
      'ivSpeed': ivSpeed,
      'ivHealth': ivHealth,
      'evDef': evDef,
      'evAtk': evAtk,
      'evSpDef': evSpDef,
      'evSpAtk': evSpAtk,
      'evSpeed': evSpeed,
      'evHealth': evHealth,
    };
  }
}
