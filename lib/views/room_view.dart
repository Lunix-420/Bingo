import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
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
    GameService.connectSocket();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        setState(() {
          room = args["room"] as Room?;
          player = args["player"] as Player?;
        });
        if (room == null || player == null) {
          Toast.show(
            "Error",
            "Room or player data is missing.",
            ToastificationType.error,
          );
          Navigator.pushNamed(context, "/");
          return;
        }
      } else {
        Navigator.pushNamed(context, "/");
        return;
      }
      GameService.emitJoinRoom(room!.code);
      GameService.onGameStateUpdated((_) {
        RoomService.getRoomById(room!.id).then((update) {
          setState(() {
            room = update;
          });
          if (room!.status == RoomStatus.started) {
            logger.i("Game Started");
          }
        });
      });
    });
  }

  bool get isHost {
    if (room == null || player?.id == null) return false;
    return room!.host.id == player!.id;
  }

  void startGame() {
    logger.i("Starting...");
    setState(() {
      future = RoomService.startRoom(room!);
    });
  }

  void gameStarted(BuildContext context, _) {
    logger.i("Game started successfully");
    GameService.emitUpdateGameState(room!.code);
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

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: "Room",
        routeName: "/home",
        actions: [
          PlayerListButtonWidget(
            players: room?.players ?? [],
            host: room?.host ?? Player(),
            currentPlayer: player ?? Player(),
          ),
        ],
      ),
      children: _page,
    );
  }
}
