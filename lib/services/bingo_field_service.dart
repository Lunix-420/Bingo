import 'dart:convert';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class BingoFieldService {
  static Future<List<BingoField>> fetchBingoFields() async {
    final url = Uri.parse(baseRoute + apiRoutes['bingo']!['get']!);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final fields = json.map((e) => BingoField.fromJson(e)).toList();
      return fields;
    } else {
      throw Exception(
        'Failed to load bingo fields (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
