import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/requests.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Tileset-Service");

class TilesetService {
  static const List<int> validSizes = [3, 4, 5, 6];

  static Future<List<Tileset>?> getTilesets(
    TilesetFilterModel filter, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postSearchAllTilesets();
      final body = jsonEncode(filter.toJson());

      logger.d('"$url": Fetching tilesets with filter: $body');

      final response = await Requests.postList(url, body);

      final tilesets = response.map((e) => Tileset.fromJson(e)).toList();

      logger.d('Fetched ${tilesets.length} tilesets successfully');

      return tilesets;
    } catch (e) {
      logger.e('Error fetching tilesets: $e');
      Toast.show(
        "Error",
        "Failed to fetch tilesets. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to fetch tilesets: $e');
      }
      return null;
    }
  }

  static Future<Tileset?> getTilesetById(
    BuildContext context, {
    bool doThrow = false,
  }) async {
    try {
      String? tilesetId = Routing.getTilesetIdFromNavigation(context);
      if (tilesetId == null) {
        throw Exception('Tileset ID not found in navigation arguments');
      }

      final url = ApiRoutes.getTilesetById(tilesetId);

      logger.d('"$url": Fetching tileset by ID: $tilesetId');

      final response = await Requests.getMap(url);

      final tileset = Tileset.fromJson(response);

      logger.d('Fetched tileset successfully: ${tileset.id}');

      return tileset;
    } catch (e) {
      logger.e('Error fetching tileset by ID: $e');
      Toast.show(
        "Error",
        "Failed to fetch tileset. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to fetch tileset by ID: $e');
      }
      return null;
    }
  }

  static Future<Tileset?> createTileset(
    Tileset tileset, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postCreateTileset();
      final body = jsonEncode(tileset.toJson());

      logger.d('"$url": Creating tileset with body: $body');

      final response = await Requests.postMap(url, body);

      logger.d('Tileset created successfully: ${response['id']}');

      return Tileset.fromJson(response);
    } catch (e) {
      logger.e('Error creating tileset: $e');
      Toast.show(
        "Error",
        "Failed to create tileset. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to create tileset: $e');
      }
      return null;
    }
  }

  static Future<Tileset?> editTileset(
    Tileset tileset, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.putUpdateTileset(tileset.id);
      final body = jsonEncode(tileset.toJson());

      logger.d('"$url": Editing tileset with body: $body');

      final response = await Requests.put(url, body);

      logger.d('Tileset edited successfully: ${tileset.id}');

      return Tileset.fromJson(response);
    } catch (e) {
      logger.e('Error editing tileset: $e');
      Toast.show(
        "Error",
        "Failed to edit tileset. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to edit tileset: $e');
      }
      return null;
    }
  }

  static Future<Tileset?> upvoteTileset(
    Tileset tileset, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postUpvoteTileset(tileset.id);

      logger.d('"$url": Upvoting tileset with ID: ${tileset.id}');

      final response = await Requests.postMap(url, "");

      logger.d('Tileset upvoted successfully: ${tileset.id}');

      return Tileset.fromJson(response);
    } catch (e) {
      logger.e('Error upvoting tileset: $e');
      Toast.show(
        "Error",
        "Failed to upvote tileset. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to upvote tileset: $e');
      }
      return null;
    }
  }

  static Future<Tileset?> downvoteTileset(
    Tileset tileset, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postDownvoteTileset(tileset.id);

      logger.d('"$url": Downvoting tileset with ID: ${tileset.id}');

      final response = await Requests.postMap(url, "");

      logger.d('Tileset downvoted successfully: ${tileset.id}');

      return Tileset.fromJson(response);
    } catch (e) {
      logger.e('Error downvoting tileset: $e');
      Toast.show(
        "Error",
        "Failed to downvote tileset. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to downvote tileset: $e');
      }
      return null;
    }
  }
}
