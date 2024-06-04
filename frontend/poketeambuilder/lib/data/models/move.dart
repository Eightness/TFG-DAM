import 'dart:convert';

class Move {
  final String name;

  Move({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  factory Move.fromJson(String json) {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;

    return Move(
      name: decodedJson['name'] as String,
    );
  }
}
