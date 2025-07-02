import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/bingo_field_model.dart';

void main() {
  group('BingoField Model Tests', () {
    test('fromJson creates a valid BingoField object', () {
      final json = {
        '_id': '1',
        'tilesetId': 'tileset1',
        'playerId': 'player1',
        'tiles': ['tile1', 'tile2'],
        'marked': [true, false],
        'size': 3,
        'isWinner': true,
      };

      final bingoField = BingoField.fromJson(json);

      expect(bingoField.id, '1');
      expect(bingoField.tilesetId, 'tileset1');
      expect(bingoField.playerId, 'player1');
      expect(bingoField.tiles, ['tile1', 'tile2']);
      expect(bingoField.marked, [true, false]);
      expect(bingoField.size, 3);
      expect(bingoField.isWinner, true);
    });
  });
}
