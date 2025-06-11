import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/services/player_service.dart';
import 'package:http/http.dart' as http;

class RoomService {
  static CreateRoomModel? getCreateRoomModelFromNavigation(
    BuildContext context,
  ) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    return args?["create-room"] as CreateRoomModel?;
  }

  static Future<Room> createRoom(CreateRoomModel model) async {
    final player = await PlayerService.createPlayer(model.hostName);

    final url = ApiRoutes.postCreateRoom();
    final body = jsonEncode(model.toJson(player));
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    try {
      // Room created successfully
      final json = jsonDecode(response.body);
      final room = Room.fromJson(json);
      // Handle the created room if needed
      return room;
    } catch (e) {
      throw Exception('Failed to create room (error: $e)');
    }
  }
}
