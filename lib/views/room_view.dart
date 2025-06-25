import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/future_create_button.dart';
import 'package:frontend/widgets/game/player_list_button.dart';
import 'package:frontend/widgets/room/code_display.dart';
import 'package:frontend/widgets/room/room_settings_display.dart';
import 'package:frontend/widgets/view_scaffold.dart';

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
      setState(() {
        room = Routing.getRoomFromArguments(context);
        player = Routing.getPlayerFromArguments(context);
      });

      GameService.connectSocket(
        onConnect: () {
          GameService.onRoomUpdate((_) {
            logger.d("Room updated, refreshing...");
            _refreshRoom();
          });
          GameService.emitJoinRoom(room!.code);
        },
      );
    });
  }

  Future<void> _refreshRoom() async {
    if (room == null) return;
    final updatedRoom = await RoomService.getRoomById(room!.id);
    if (updatedRoom != null) {
      setState(() {
        room = updatedRoom;
      });
    }
  }

  bool get _isHost => room?.host.id == player?.id;

  Future<int> _startFuture(Room room) async =>
      (await RoomService.startRoom(room, doThrow: true))!;

  void _startGame() {
    if (room == null) {
      return;
    }
    logger.d("Starting...");
    setState(() {
      future = _startFuture(room!);
    });
  }

  void _gameStarted(BuildContext context, _) {
    if (RoomView.navigated) {
      return;
    }
    logger.d("Game started successfully");
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
      _isHost
          ? FutureCreateButtonWidget(
            future: future,
            buttonText: "Start Game",
            loadedText: "Game Started",
            buttonCallback: _startGame,
            onDone: _gameStarted,
          )
          : Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacings.medium),
            child: Text(
              "Waiting for host to start...",
              style: TextStyles.normal(),
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
      Routing.navigateGame(context, room: room!, player: player!);
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateToGame(context);
    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: "Room",
        routeName: Routing.homeRoute,
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
