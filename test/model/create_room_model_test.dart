import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/tileset_model.dart';

void main() {
  group('CreateRoomModel Tests', () {
    test('isValid returns true for valid model', () {
      final tileset = Tileset();
      final model = CreateRoomModel(
        maxPlayers: 8,
        isVersus: true,
        hostName: 'Host',
        tileset: tileset,
      );

      expect(model.isValid, true);
    });

    test('toJson throws exception for invalid model', () {
      final player = Player('Player');
      final model = CreateRoomModel();

      expect(() => model.toJson(player), throwsException);
    });
  });
}
