import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/future_create_button.dart';
import 'package:frontend/widgets/game/player_list_button.dart';
import 'package:frontend/widgets/room/code_display.dart';
import 'package:frontend/widgets/room/room_settings_display.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Room-View");

class RoomView extends StatefulWidget {
  static bool navigated = false;

  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  Room? room;
  Player? player;
  Future<int>? future;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        setState(() {
          room = Routing.getRoomFromArguments(context);
          player = Routing.getPlayerFromArguments(context);
        });
      } catch (e) {
        logger.e("Error getting room or player from arguments: $e");
        Toast.show(
          "Error",
          "Failed to retrieve room or player data.",
          ToastificationType.error,
        );
        Navigator.pushNamed(context, "/");
        return;
      }

      GameService.connectSocket(
        onConnect: () {
          GameService.onRoomUpdate((_) {
            logger.i("Room updated, refreshing...");
            _refreshRoom();
          });
          GameService.emitJoinRoom(room!.code);
        },
      );
    });
  }

  Future<void> _refreshRoom() async {
    if (room == null) return;
    try {
      final updatedRoom = await RoomService.getRoomById(room!.id);
      setState(() {
        room = updatedRoom;
      });
    } catch (e) {
      logger.e("Error refreshing room: $e");
      Toast.show(
        "Error",
        "Failed to refresh room data.",
        ToastificationType.error,
      );
    }
  }

  bool get isHost {
    if (room == null || player?.id == null) return false;
    return room!.host.id == player!.id;
  }

  Future<int> startFuture(Room room) async =>
      (await RoomService.startRoom(room, doThrow: true))!;

  void startGame() {
    if (room == null) {
      return;
    }
    logger.i("Starting...");
    setState(() {
      future = startFuture(room!);
    });
  }

  void gameStarted(BuildContext context, _) {
    if (RoomView.navigated) {
      return;
    }
    logger.i("Game started successfully");
    GameService.emitUpdateGameState(room!.code);
    _refreshRoom();
  }

  List<Widget> get _page {
    if (room == null) {
      return [Center(child: Text("Loading..."))];
    }

    return [
      CodeDisplayWidget(code: room!.code),
      BingoPreviewCardWidget(tileset: room!.tileset),
      RoomSettingsDisplayWidget(room: room!),
      isHost
          ? FutureCreateButtonWidget(
            future: future,
            buttonText: "Start Game",
            loadedText: "Game Started",
            buttonCallback: startGame,
            onDone: gameStarted,
            onError: (error) => logger.e(error),
          )
          : Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Waiting for host to start...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ),
    ];
  }

  void _navigateToGame(BuildContext context) {
    if (room == null ||
        player == null ||
        room!.status != RoomStatus.started ||
        RoomView.navigated) {
      return;
    }
    GameService.removeListeners();
    RoomView.navigated = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Routing.navigateWithRoomPlayer(context, "/game", room, player);
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateToGame(context);
    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: "Room",
        routeName: "/home",
        actions: [
          PlayerListButtonWidget(
            players: room?.players ?? [],
            host: room?.host ?? Player(""),
            currentPlayer: player ?? Player(""),
          ),
        ],
      ),
      children: _page,
    );
  }
}
