import 'dart:convert';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class BingoFieldService {
  static Future<BingoField> checkField(
    BingoField field,
    Player player,
    int tile,
  ) async {
    final url = ApiRoutes.postCheckField(field.id);
    final body = jsonEncode({'player': player.id, 'tile': tile});

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to check field: ${response.body}');
    }
    final List<dynamic> decoded = jsonDecode(response.body);
    final result = BingoField.fromJson(decoded.first);
    return result;
  }
}
