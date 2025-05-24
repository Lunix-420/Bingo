class BingoField {
  final List<String> tiles;
  final List<bool> marked;
  final int size; // Enum of [3,4,5,6]
  final bool isWinner;

  BingoField._({
    required this.tiles,
    required this.marked,
    required this.size,
    required this.isWinner,
  });

  factory BingoField.fromJson(Map<String, dynamic> json) {
    return BingoField._(
      tiles: List<String>.from(json['tiles']),
      marked: List<bool>.from(json['marked']),
      size: json['size'],
      isWinner: json['isWinner'] ?? false,
    );
  }
}
