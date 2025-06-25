import 'dart:convert';

import 'package:frontend/model/player_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/requests.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Player-Service");

class PlayerService {
  static Future<Player?> createPlayer(
    String name, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postCreatePlayer();
      final body = jsonEncode({"name": name});

      logger.d('"$url": Creating player with name: $name');

      final response = await Requests.postMap(url, body);

      logger.d('Player created successfully: $response');

      return Player.fromJson(response);
    } catch (e) {
      logger.e('Error creating player: $e');
      Toast.show(
        "Error",
        "Failed to create player. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to create player: $e');
      }
      return null;
    }
  }
}
