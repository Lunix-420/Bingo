import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class TilesetService {
  static Future<List<Tileset>> fetchTilesets() async {
    final url = ApiRoutes.getAllTilesets();
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body);
      final json = jsonDecode(response.body) as List;
      final tilesets = json.map((e) => Tileset.fromJson(e)).toList();
      return tilesets;
    } else {
      throw Exception(
        'Failed to load tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<Tileset> getTilesetById(BuildContext context) async {
    String tilesetId;
    try {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      tilesetId = args?["id"];
    } catch (e) {
      throw Exception("No tileset ID provided in route arguments.");
    }

    final url = ApiRoutes.getTilesetById(tilesetId);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final tileset = Tileset.fromJson(json);
      return tileset;
    } else {
      throw Exception(
        "Failed to load tileset with id $tilesetId (status: ${response.statusCode}, body: ${response.body})",
      );
    }
  }
}
