import 'package:frontend/model/tileset.model.dart';
import 'package:frontend/services/api.routes.dart';
import 'package:http/http.dart' as http;

class TilesetService {
  static Future<Tileset> fetchTileset() async {
    final url = Uri.parse(apiRoutes['tileset']!['get']!);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final tileset = Tileset.fromJson(response.body);
      return tileset;
    } else {
      throw Exception('Failed to load tileset');
    }
  }
}
