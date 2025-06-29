import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/player_model.dart';

void main() {
  group('Player Tests', () {
    test('Player should initialize correctly', () {
      final player = Player('Test Player');

      expect(player.name, 'Test Player');
      expect(player.id, '');
    });

    test('Player.fromJson should parse JSON correctly', () {
      final json = {'name': 'Test Player', '_id': '123'};

      final player = Player.fromJson(json);

      expect(player.name, 'Test Player');
      expect(player.id, '123');
    });

    test('Player.toJson should convert to JSON correctly', () {
      final player = Player('Test Player');

      final json = player.toJson();

      expect(json['name'], 'Test Player');
      expect(json['_id'], '');
    });
  });
}
