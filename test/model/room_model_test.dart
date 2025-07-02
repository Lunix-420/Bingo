import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/room_model.dart';

void main() {
  group('Room Tests', () {
    test('Room should initialize correctly', () {
      final room = Room();

      expect(room.id, '');
      expect(room.code, '');
      expect(room.tileset, isNotNull);
      expect(room.players.length, 1);
      expect(room.host.name, 'Host');
      expect(room.status, RoomStatus.waiting);
      expect(room.maxPlayers, 4);
      expect(room.isVersus, false);
      expect(room.bingofields, isEmpty);
    });

    test('Room.fromJson should parse JSON correctly', () {
      final Map<String, dynamic> json = {
        '_id': '123',
        'code': 'ABC123',
        'isVersus': true,
        'bingofields': [
          {
            '_id': 'field1',
            'tilesetId': 'tileset1',
            'playerId': 'player1',
            'tiles': ['Tile1', 'Tile2'],
            'marked': [true, false],
            'size': 2,
            'isWinner': false,
          },
        ],
        'tileset': {
          '_id': 'tileset1',
          'name': 'Test Tileset',
          'size': 2,
          'rating': 5,
          'tiles': ['Tile1', 'Tile2'],
          'tags': ['Tag1', 'Tag2'],
          'plays': 10,
        },
        'players': [
          {'name': 'Player1', '_id': 'player1'},
          {'name': 'Player2', '_id': 'player2'},
        ],
        'host': {'name': 'Host', '_id': 'host1'},
        'status': 'waiting',
        'maxPlayers': 4,
      };

      final room = Room.fromJson(json);

      expect(room.id, '123');
      expect(room.code, 'ABC123');
      expect(room.isVersus, true);
      expect(room.bingofields.length, 1);
      expect(room.tileset.name, 'Test Tileset');
      expect(room.players.length, 2);
      expect(room.host.name, 'Host');
      expect(room.status, RoomStatus.waiting);
      expect(room.maxPlayers, 4);
    });
  });
}
