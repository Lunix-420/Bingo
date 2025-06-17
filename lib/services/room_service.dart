import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/player_model.dart';
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
      final roomId = json as String;
      // Handle the created room if needed
      return getRoomById(roomId);
    } catch (e) {
      throw Exception('Failed to create room (error: $e)');
    }
  }

  static Room getRoomFromArguments(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey('room')) {
      throw Exception('Room not found in arguments');
    }
    return args['room'] as Room;
  }

  static Player getPlayerFromArguments(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey('player')) {
      throw Exception('Player not found in arguments');
    }
    return args['player'] as Player;
  }

  static Future<Room> addPlayerToRoom(Room room, Player player) async {
    final url = ApiRoutes.postPlayerJoinRoom(room.id);
    final body = jsonEncode({'player': player.toJson()});
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      return getRoomById(room.id);
    } else {
      throw Exception('Failed to add player to room');
    }
  }

  static Future<Room> getRoomByCode(String code) async {
    final url = ApiRoutes.getRoomIdFromCode(code);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final roomId = json['_id'] as String?;
      if (roomId == null) {
        throw Exception('Room ID not found in response');
      }
      return getRoomById(roomId);
    } else {
      throw Exception('Failed to fetch room by code');
    }
  }

  static Future<Room> getRoomById(String id) async {
    final url = ApiRoutes.getRoomById(id);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Room.fromJson(json);
    } else {
      throw Exception('Failed to fetch room by ID');
    }
  }

  static Future<int> startRoom(Room room) async {
    final url = ApiRoutes.postRoomStart(room.id);
    final response = await http.post(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to start room');
    }
    return 0;
  }
}
