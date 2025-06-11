import 'dart:convert';

import 'package:frontend/model/player_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class PlayerService {
  static Future<Player> createPlayer(String name) async {
    final uri = ApiRoutes.postCreatePlayer();
    final body = jsonEncode({"name": name});
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Player.fromJson(json);
    } else {
      throw Exception(
        'Failed to create player (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
