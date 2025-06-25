import 'dart:async';
import 'dart:convert';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/services/player_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/requests.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Room-Service");

class RoomService {
  static Future<Room?> createRoom(
    CreateRoomModel model, {
    bool doThrow = false,
  }) async {
    try {
      final player = await PlayerService.createPlayer(
        model.hostName,
        doThrow: true,
      );

      final url = ApiRoutes.postCreateRoom();
      final body = jsonEncode(model.toJson(player!));

      logger.d('"$url": Creating room with body: $body');

      final response = await Requests.post(url, body);

      final roomId = response as String;

      logger.d('Room created successfully with ID: $roomId');

      return getRoomById(roomId, doThrow: true);
    } catch (e) {
      logger.e('Error creating room: $e');
      Toast.show(
        "Error",
        "Please check your inputs for errors.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to create room: $e');
      }
      return null;
    }
  }

  static Future<Room?> addPlayerToRoom(
    Room room,
    Player player, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.postPlayerJoinRoom(room.id);
      final body = jsonEncode({'player': player.toJson()});

      logger.d('"$url": Adding player to room: ${room.id} with body: $body');

      await Requests.post(url, body);

      logger.d('Player added to room successfully: ${room.id}');

      return getRoomById(room.id);
    } catch (e) {
      logger.e('Error adding player to room: $e');
      Toast.show(
        "Error",
        "Failed to add player to room. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to add player to room: $e');
      }
      return null;
    }
  }

  static Future<Room?> getRoomByCode(
    String code, {
    bool doThrow = false,
  }) async {
    try {
      final url = ApiRoutes.getRoomIdFromCode(code);

      logger.d('"$url": Getting room by code: $code');

      final response = await Requests.get(url);

      final roomId = response as String?;
      if (roomId == null) {
        throw Exception('Room ID not found in response');
      }

      logger.d('Room ID retrieved successfully: $roomId');

      return getRoomById(roomId, doThrow: true);
    } catch (e) {
      logger.e('Error getting room by code: $e');
      Toast.show(
        "Error",
        "Failed to retrieve room by code. Please check the code and try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to get room by code: $e');
      }
      return null;
    }
  }

  static Future<Room?> getRoomById(String id, {bool doThrow = false}) async {
    try {
      final url = ApiRoutes.getRoomById(id);

      logger.d('"$url": Getting room by ID: $id');

      final response = await Requests.getMap(url);

      final room = Room.fromJson(response);

      logger.d('Room retrieved successfully: ${room.id}');

      return room;
    } catch (e) {
      logger.e('Error getting room by ID: $e');
      Toast.show(
        "Error",
        "Failed to retrieve room by ID. Please check the ID and try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to get room by ID: $e');
      }
      return null;
    }
  }

  static Future<int?> startRoom(Room room, {bool doThrow = false}) async {
    try {
      final url = ApiRoutes.postRoomStart(room.id);

      logger.d('"$url": Starting room with ID: ${room.id}');

      await Requests.post(url, "");

      logger.d('Room started successfully: ${room.id}');

      return 0;
    } catch (e) {
      logger.e('Error starting room: $e');
      Toast.show(
        "Error",
        "Failed to start the room. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to start room: $e');
      }
      return null;
    }
  }

  static Future<(Room?, Player?)> joinRoom(
    String playerName,
    String roomCode, {
    bool doThrow = false,
  }) async {
    try {
      logger.d(
        'Joining room with code: $roomCode and player name: $playerName',
      );

      final roomFromCode = await getRoomByCode(roomCode, doThrow: true);
      final player = await PlayerService.createPlayer(
        playerName,
        doThrow: true,
      );

      final room = await addPlayerToRoom(roomFromCode!, player!, doThrow: true);

      logger.d(
        'Joined room successfully: ${room!.id} with player: ${player.id}',
      );

      return (room, player);
    } catch (e) {
      logger.e('Error joining room: $e');
      Toast.show(
        "Error",
        "Failed to join the room. Please try again.",
        ToastificationType.error,
      );
      if (doThrow) {
        throw Exception('Failed to join room: $e');
      }
      return (null, null);
    }
  }
}
