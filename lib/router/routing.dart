import 'package:flutter/material.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Routing");

class Routing {
  static const String homeRoute = '/home';
  static const String cardListRoute = '/list';
  static const String cardEditRoute = '/edit';
  static const String cardPreviewRoute = '/preview';
  static const String cardCreateRoute = '/create-card';
  static const String roomRoute = '/room';
  static const String roomCreateRoute = '/create-room';
  static const String gameRoute = '/game';
  static const String gameEndRoute = '/game-end';
  static const String testRoute = '/test';

  static const String argumentTilesetId = 'tilesetId';
  static const String argumentCreateRoom = 'create-room';
  static const String argumentRoom = 'room';
  static const String argumentPlayer = 'player';

  static T _getArgument<T>(BuildContext context, String key) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey(key) || args[key] == null) {
      throw Exception('$key not found in arguments');
    }
    return args[key] as T;
  }

  static T? _getOptionalArgument<T>(BuildContext context, String key) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args == null || !args.containsKey(key) || args[key] == null) {
      return null;
    }
    return args[key] as T;
  }

  static Room? getRoomFromArguments(BuildContext context) {
    try {
      return _getArgument<Room>(context, argumentRoom);
    } catch (e) {
      logger.e("Error getting room from arguments: $e");
      Toast.show(
        "Error",
        "Failed to retrieve room data.",
        ToastificationType.error,
      );
      navigateHome(context);
      return null;
    }
  }

  static Player? getPlayerFromArguments(BuildContext context) {
    try {
      return _getArgument<Player>(context, argumentPlayer);
    } catch (e) {
      logger.e("Error getting player from arguments: $e");
      Toast.show(
        "Error",
        "Failed to retrieve player data.",
        ToastificationType.error,
      );
      navigateHome(context);
      return null;
    }
  }

  static String? getTilesetIdFromNavigation(BuildContext context) {
    return _getOptionalArgument<String>(context, argumentTilesetId);
  }

  static CreateRoomModel? getCreateRoomModelFromNavigation(
    BuildContext context,
  ) {
    return _getOptionalArgument<CreateRoomModel>(context, argumentCreateRoom);
  }

  // --------------------------  NAVIGATION --------------------------

  static void navigateRoom(
    BuildContext context, {
    required Room room,
    required Player player,
  }) {
    Navigator.pushNamed(
      context,
      roomRoute,
      arguments: {argumentRoom: room, argumentPlayer: player},
    );
  }

  static void navigateGame(
    BuildContext context, {
    required Room room,
    required Player player,
  }) {
    Navigator.pushNamed(
      context,
      gameRoute,
      arguments: {argumentRoom: room, argumentPlayer: player},
    );
  }

  static void navigateGameEnd(
    BuildContext context, {
    required Room room,
    required Player player,
  }) {
    Navigator.pushNamed(
      context,
      gameEndRoute,
      arguments: {argumentRoom: room, argumentPlayer: player},
    );
  }

  static void navigateHome(BuildContext context) {
    Navigator.pushNamed(context, homeRoute);
  }

  static void navigateCardEdit(BuildContext context, String tilesetId) {
    Navigator.pushNamed(
      context,
      cardEditRoute,
      arguments: {argumentTilesetId: tilesetId},
    );
  }

  static void navigateCreateRoom(
    BuildContext context, {
    CreateRoomModel? createRoom,
  }) {
    Navigator.pushNamed(
      context,
      roomCreateRoute,
      arguments: {argumentCreateRoom: createRoom},
    );
  }

  static void navigateCardList(
    BuildContext context, {
    CreateRoomModel? createRoom,
  }) {
    Navigator.pushNamed(
      context,
      cardListRoute,
      arguments: {argumentCreateRoom: createRoom},
    );
  }

  static void navigateCreateCard(BuildContext context) {
    Navigator.pushNamed(context, cardCreateRoute);
  }

  static void navigateCardPreview(
    BuildContext context, {
    required String tilesetId,
  }) {
    Navigator.pushNamed(
      context,
      cardPreviewRoute,
      arguments: {argumentTilesetId: tilesetId},
    );
  }

  static void navigateBack(BuildContext context, {dynamic value}) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, value);
    } else {
      navigateHome(context);
    }
  }
}
