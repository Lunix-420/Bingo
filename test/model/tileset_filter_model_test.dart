import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/model/tileset_filter_model.dart';

void main() {
  group('TilesetFilterModel Tests', () {
    test('TilesetFilterModel should initialize correctly', () {
      final filter = TilesetFilterModel(
        search: 'test',
        sort: SortOptions.nameAsc,
        tags: ['tag1', 'tag2'],
        size: [1, 2],
        rating: 5,
        plays: 10,
      );

      expect(filter.search, 'test');
      expect(filter.sort, SortOptions.nameAsc);
      expect(filter.tags, ['tag1', 'tag2']);
      expect(filter.size, [1, 2]);
      expect(filter.rating, 5);
      expect(filter.plays, 10);
    });

    test('TilesetFilterModel.toJson should convert to JSON correctly', () {
      final filter = TilesetFilterModel(
        search: 'test',
        sort: SortOptions.nameAsc,
        tags: ['tag1', 'tag2'],
        size: [1, 2],
        rating: 5,
        plays: 10,
      );

      final json = filter.toJson();

      expect(json['names'], ['test']);
      expect(json['tags'], ['tag1', 'tag2']);
      expect(json['sizes'], [1, 2]);
      expect(json['rating'], 5);
      expect(json['plays'], 10);
      expect(json['sort'], {'field': 'name', 'order': 'asc'});
    });
  });
}
