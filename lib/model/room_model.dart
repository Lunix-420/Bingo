import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/tileset_model.dart';

enum RoomStatus { waiting, playing, finished }

RoomStatus roomStatusFromString(String value) {
  switch (value) {
    case 'waiting':
      return RoomStatus.waiting;
    case 'playing':
      return RoomStatus.playing;
    case 'finished':
      return RoomStatus.finished;
    default:
      throw ArgumentError('Invalid status value: $value');
  }
}

String roomStatusToString(RoomStatus status) {
  switch (status) {
    case RoomStatus.waiting:
      return 'waiting';
    case RoomStatus.playing:
      return 'playing';
    case RoomStatus.finished:
      return 'finished';
  }
}

class Room {
  final String code;
  final Tileset tileset;
  final String? ruleset = null; // TODO: add later when backend has
  final List<Player> players;
  final Player host;
  final RoomStatus status;
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
      status: roomStatusFromString(json['status']),
      maxPlayers: json['maxPlayers'],
    );
  }
}
