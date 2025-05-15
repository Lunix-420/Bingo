import 'dart:convert';

class Tileset {
  final String name;
  final int size;
  final List<String> tiles;
  final List<String> tags;

  Tileset({
    required this.name,
    required this.size,
    required this.tiles,
    required this.tags,
  });

  factory Tileset.fromJson(String input) {
    final json = jsonDecode(input);

    return Tileset(
      name: json['name'],
      size: json['size'],
      tiles: List<String>.from(json['tiles']),
      tags: List<String>.from(json['tags']),
    );
  }
}
