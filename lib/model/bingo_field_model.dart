class BingoField {
  final String id;
  final String tilesetId;
  final String playerId;
  final List<String> tiles;
  List<bool> marked;
  final int size; // Enum of [3,4,5,6]
  final bool isWinner;

  BingoField._({
    required this.id,
    required this.tilesetId,
    required this.playerId,
    required this.tiles,
    required this.marked,
    required this.size,
    required this.isWinner,
  });

  factory BingoField.fromJson(Map<String, dynamic> json) {
    return BingoField._(
      id: json['_id'],
      tilesetId: json['tilesetId'],
      playerId: json['playerId'],
      tiles: List<String>.from(json['tiles']),
      marked: List<bool>.from(json['marked']),
      size: json['size'],
      isWinner: json['isWinner'] ?? false,
    );
  }
}
