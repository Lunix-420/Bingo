import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/tileset_model.dart';

void main() {
  group('Tileset Tests', () {
    test('Tileset should initialize correctly', () {
      final tileset = Tileset();

      expect(tileset.id, '');
      expect(tileset.name, 'New Card');
      expect(tileset.size, 5);
      expect(tileset.rating, 0);
      expect(tileset.tiles.length, 25);
      expect(tileset.tags, isEmpty);
      expect(tileset.plays, 0);
    });

    test('Tileset.fromJson should parse JSON correctly', () {
      final json = {
        '_id': '123',
        'name': 'Test Tileset',
        'size': 4,
        'rating': 5,
        'tiles': ['Tile1', 'Tile2'],
        'tags': ['Tag1', 'Tag2'],
        'plays': 10,
      };

      final tileset = Tileset.fromJson(json);

      expect(tileset.id, '123');
      expect(tileset.name, 'Test Tileset');
      expect(tileset.size, 4);
      expect(tileset.rating, 5);
      expect(tileset.tiles, ['Tile1', 'Tile2']);
      expect(tileset.tags, ['Tag1', 'Tag2']);
      expect(tileset.plays, 10);
    });

    test("Tileset.toJson should convert to JSON correctly", () {
      final tileset = Tileset();
      tileset.name = 'Test Tileset';
      tileset.size = 4;
      tileset.rating = 5;
      tileset.tiles = ['Tile1', 'Tile2'];
      tileset.tags = ['Tag1', 'Tag2'];
      tileset.plays = 10;

      final json = tileset.toJson();

      expect(json['_id'], isNull);
      expect(json['name'], 'Test Tileset');
      expect(json['size'], 4);
      expect(json['rating'], 5);
      expect(json['tiles'], ['Tile1', 'Tile2']);
      expect(json['tags'], ['Tag1', 'Tag2']);
      expect(json['plays'], 10);
    });

    test('Tileset.changeSize should update size and tiles correctly', () {
      final tileset = Tileset();
      tileset.changeSize(3);

      expect(tileset.size, 3);
      expect(tileset.tiles.length, 9);
    });

    test("Tileset.changeSize should throw an exception for invalid size", () {
      final tileset = Tileset();

      expect(() => tileset.changeSize(-1), throwsA(isA<Exception>()));
      expect(() => tileset.changeSize(999999), throwsA(isA<Exception>()));
    });
  });
}
