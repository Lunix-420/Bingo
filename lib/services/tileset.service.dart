import 'dart:convert';

import 'package:frontend/model/tileset.model.dart';
import 'package:frontend/services/api.routes.dart';
import 'package:http/http.dart' as http;

class TilesetService {
  static Future<List<Tileset>> fetchTilesets() async {
    final url = Uri.parse(baseRoute + apiRoutes['tilesets']!['get']!);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final tilesets = json.map((e) => Tileset.fromJson(e)).toList();
      return tilesets;
    } else {
      throw Exception(
        'Failed to load tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
