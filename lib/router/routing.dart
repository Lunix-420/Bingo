import 'package:flutter/material.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';

class Routing {
  static T _getArgument<T>(BuildContext context, String key) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey(key)) {
      throw Exception('$key not found in arguments');
    }
    return args[key] as T;
  }

  static T? _getOptionalArgument<T>(BuildContext context, String key) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey(key)) {
      return null;
    }
    return args[key] as T;
  }

  static Room getRoomFromArguments(BuildContext context) {
    return _getArgument<Room>(context, 'room');
  }

  static Player getPlayerFromArguments(BuildContext context) {
    return _getArgument<Player>(context, 'player');
  }

  static String? getTilesetIdFromNavigation(BuildContext context) {
    return _getOptionalArgument<String>(context, 'tilesetId');
  }

  static CreateRoomModel? getCreateRoomModelFromNavigation(
    BuildContext context,
  ) {
    return _getOptionalArgument<CreateRoomModel>(context, 'create-room');
  }

  static void navigateWithRoomPlayer(
    BuildContext context,
    String path,
    Room? room,
    Player? player,
  ) {
    Navigator.pushNamed(
      context,
      path,
      arguments: {'room': room, 'player': player},
    );
  }

  static void navigateHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
}
