import 'package:frontend/services/tileset_service.dart';

class Tileset {
  String name;
  int size; // Enum of [3,4,5,6]
  double rating; // Min of 0
  List<String> tiles; // List of tile names, size * size
  List<String> tags;
  int plays; // Number of times this tileset has been played

  Tileset._({
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
      name: "New Card",
      plays: 0,
      size: newSize,
      rating: 0.0,
      tiles: newTiles,
      tags: [],
    );
  }

  factory Tileset.fromJson(Map<String, dynamic> json) {
    return Tileset._(
      name: json['name'],
      size: json['size'],
      rating: (json['rating'] as num).toDouble(),
      tiles: List<String>.from(json['tiles']),
      tags: List<String>.from(json['tags']),
      plays: json['plays'],
    );
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
