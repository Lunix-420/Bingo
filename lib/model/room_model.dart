import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/tileset_model.dart';

enum RoomStatus { waiting, started, finished }

RoomStatus roomStatusFromString(String value) {
  switch (value) {
    case 'waiting':
      return RoomStatus.waiting;
    case 'started':
      return RoomStatus.started;
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
    case RoomStatus.started:
      return 'playing';
    case RoomStatus.finished:
      return 'finished';
  }
}

class Room {
  final String id;
  final String code;
  final bool isVersus;
  final Tileset tileset;
  final List<Player> players;
  final List<BingoField> bingofields;
  final Player host;
  final RoomStatus status;
  final int maxPlayers;

  Room._({
    required this.id,
    required this.code,
    required this.tileset,
    required this.players,
    required this.host,
    required this.status,
    required this.maxPlayers,
    required this.isVersus,
    required this.bingofields,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room._(
      id: json['_id'],
      isVersus: json['isVersus'],
      bingofields:
          (json['bingofields'] as List)
              .map((field) => BingoField.fromJson(field))
              .toList(),
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
