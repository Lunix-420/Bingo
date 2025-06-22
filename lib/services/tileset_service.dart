import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class TilesetService {
  static const List<int> validSizes = [3, 4, 5, 6];

  static Future<List<Tileset>> getTilesets(TilesetFilterModel filter) async {
    final url = ApiRoutes.postSearchAllTilesets();

    final body = jsonEncode({
      "search": filter.search,
      "tags": filter.tags,
      "size": filter.size,
      "rating": filter.rating,
      "plays": filter.plays,
      "sort": CardListSort.optionToRequest(filter.sort),
    });

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

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

  static Future<Tileset> createTileset(Tileset tileset) async {
    final url = ApiRoutes.postCreateTileset();
    final body = jsonEncode(tileset.toJson());

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Tileset.fromJson(json);
    } else {
      throw Exception(
        'Failed to create tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<Tileset> editTileset(Tileset tileset) async {
    final url = ApiRoutes.putUpdateTileset(tileset.id);
    final body = jsonEncode(tileset.toJson());

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Tileset.fromJson(json);
    } else {
      throw Exception(
        'Failed to edit tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<Tileset> upvoteTileset(Tileset tileset) async {
    final url = ApiRoutes.postUpvoteTileset(tileset.id);
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Tileset.fromJson(json);
    } else {
      throw Exception(
        'Failed to upvote tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<Tileset> downvoteTileset(Tileset tielset) async {
    final url = ApiRoutes.postDownvoteTileset(tielset.id);
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Tileset.fromJson(json);
    } else {
      throw Exception(
        'Failed to downvote tileset (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
