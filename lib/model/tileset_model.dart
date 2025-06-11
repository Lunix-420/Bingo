import 'package:frontend/services/tileset_service.dart';

class Tileset {
  String id;
  String name;
  int size; // Enum of [3,4,5,6]
  int rating; // Min of 0
  List<String> tiles; // List of tile names, size * size
  List<String> tags;
  int plays; // Number of times this tileset has been played

  Tileset._({
    this.id = "",
    required this.name,
    required this.size,
    required this.rating,
    required this.tiles,
    required this.tags,
    required this.plays,
  });

  factory Tileset() {
    final newSize = 5;
    final newTiles = List.generate(newSize * newSize, (_) => "");
    return Tileset._(
      id: "",
      name: "New Card",
      plays: 0,
      size: newSize,
      rating: 0,
      tiles: newTiles,
      tags: [],
    );
  }

  factory Tileset.fromJson(Map<String, dynamic> json) {
    return Tileset._(
      id: json['_id'],
      name: json['name'],
      size: json['size'],
      rating: json['rating'],
      tiles: List<String>.from(json['tiles']),
      tags: List<String>.from(json['tags']),
      plays: json['plays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'size': size,
      'rating': rating,
      'tiles': tiles,
      'tags': tags,
      'plays': plays,
    };
  }

  // Can throw an Exception if the size is invalid
  void changeSize(int newSize) {
    if (!TilesetService.validSizes.contains(newSize)) {
      throw Exception(
        "Invalid size: $newSize. Valid sizes are: ${TilesetService.validSizes}",
      );
    }
    size = newSize;
    // Resize tiles list
    final newTiles = List.generate(newSize * newSize, (_) => "");
    for (int i = 0; i < tiles.length && i < newTiles.length; i++) {
      newTiles[i] = tiles[i];
    }
    tiles = newTiles;
  }
}
