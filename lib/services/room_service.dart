import 'dart:convert';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:http/http.dart' as http;

class RoomService {
  static Future<List<Room>> fetchRooms() async {
    final url = ApiRoutes.getAllTilesets(); // FIXME: api route
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final rooms = json.map((e) => Room.fromJson(e)).toList();
      return rooms;
    } else {
      throw Exception(
        'Failed to load rooms (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
