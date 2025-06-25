import 'dart:convert';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/requests.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Bingo-Field-Service");

class BingoFieldService {
  static Future<BingoField?> checkField(
    BingoField field,
    Player player,
    int tile, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postCheckField(field.id);
      final body = jsonEncode({'player': player.id, 'tile': tile});

      logger.d('"$url": Checking field with body: $body');

      final response = await Requests.postList(url, body);

      final result = BingoField.fromJson(response.first);

      logger.d('Field checked successfully: ${response.first}');

      return result;
    } catch (e) {
      logger.e('Error checking field: $e');
      Toast.show(
        "Error",
        "Failed to check field. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to check field: $e');
      }
      return null;
    }
  }
}
