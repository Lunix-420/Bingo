import 'dart:convert';
import 'package:frontend/model/room.model.dart';
import 'package:frontend/services/api.routes.dart';
import 'package:http/http.dart' as http;

class RoomService {
  static Future<List<Room>> fetchRooms() async {
    final url = Uri.parse(baseRoute + apiRoutes['game']!['get']!);
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
