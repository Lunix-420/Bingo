class Tileset {
  final String name;
  final int size; // Enum of [3,4,5,6]
  final double rating; // Min of 0
  final List<String> tiles; // List of tile names, size * size
  final List<String> tags;
  final int plays; // Number of times this tileset has been played

  Tileset._({
    required this.name,
    required this.size,
    required this.rating,
    required this.tiles,
    required this.tags,
    required this.plays,
  });

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
}
