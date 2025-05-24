import 'package:frontend/model/player.model.dart';
import 'package:frontend/model/tileset.model.dart';

class Room {
  final String code;
  final Tileset tileset;
  final String? ruleset = null; // TODO: add later when backend has
  final List<Player> players;
  final Player host;
  final String status; // Enum of [waiting, playing, finished]
  final int maxPlayers;

  Room._({
    required this.code,
    required this.tileset,
    required this.players,
    required this.host,
    required this.status,
    required this.maxPlayers,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room._(
      code: json['code'],
      tileset: Tileset.fromJson(json['tileset']),
      players:
          (json['players'] as List)
              .map((player) => Player.fromJson(player))
              .toList(),
      host: Player.fromJson(json['host']),
      status: json['status'],
      maxPlayers: json['maxPlayers'],
    );
  }
}
