import 'package:flutter/material.dart';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/bingo_field_service.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/focus_utils.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/checkable_field.dart';
import 'package:frontend/widgets/game/player_list_button.dart';
import 'package:frontend/widgets/view_scaffold.dart';

final logger = namedLogger("Game-View");

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Room? room;
  Player? player;
  int? focusedField;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        room = Routing.getRoomFromArguments(context);
        player = Routing.getPlayerFromArguments(context);
      });
    });
    FocusManager.instance.addListener(_handleFocusChange);
    GameService.onGameUpdate(_refreshRoom);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_handleFocusChange);
    GameService.removeListeners();
    super.dispose();
  }

  Future<void> _refreshRoom(_) async {
    if (room == null) {
      return;
    }

    final updatedRoom = await RoomService.getRoomById(room!.id);

    if (updatedRoom == null) {
      return;
    }

    _updateRoom(updatedRoom);
  }

  void _updateRoom(Room updatedRoom) {
    setState(() {
      room = updatedRoom;
    });
    if (room == null || player == null) {
      logger.w("Room or player is null, cannot update state");
      return;
    }
    final hasWon = room!.bingofields.any((f) => f.isWinner);
    if (hasWon || room!.status == RoomStatus.finished) {
      logger.i("Game finished, well done");
      Routing.navigateGameEnd(context, room: room!, player: player!);
    }
  }

  void _handleFocusChange() {
    final node = getFocusedElement<CheckableTileWidget>();
    setState(() {
      focusedField = node?.index;
    });
  }

  BingoField? get _bingoField {
    if (room == null || player == null) {
      return null;
    }
    try {
      return room!.bingofields.firstWhere((f) => f.playerId == player!.id);
    } catch (e) {
      logger.w("Error getting player's bingo field: $e");
      return null;
    }
  }

  List<String> get _tiles => _bingoField?.tiles ?? [];

  List<bool> get _checked => _bingoField?.marked ?? [];

  Future<void> _handleCheckChange(int index) async {
    if (_bingoField == null || player == null) {
      return;
    }

    final response = await BingoFieldService.checkField(
      _bingoField!,
      player!,
      index,
    );

    if (response == null) {
      return;
    }

    final roomResponse = await RoomService.getRoomById(room!.id);

    if (roomResponse == null) {
      return;
    }

    _updateRoom(roomResponse);
  }

  void handleButtonPress() {
    if (focusedField == null) {
      return;
    }
    _handleCheckChange(focusedField!);
  }

  ElevatedButton _buildCheckButton() {
    if (focusedField == null ||
        focusedField! < 0 ||
        focusedField! >= _tiles.length) {
      return ElevatedButton(
        onPressed: null,
        child: const Text("Select a tile..."),
      );
    }
    return ElevatedButton(
      onPressed: () => _handleCheckChange(focusedField!),
      child: Text(_checked[focusedField!] ? "Uncheck" : "Check"),
    );
  }

  void _handleBackPressed() async {
    if (room == null || player == null) {
      return;
    }

    await RoomService.leaveRoom(room!, player!);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: "Game",
        onBackPressed: _handleBackPressed,
        routeName: Routing.homeRoute,
        actions: [
          PlayerListButtonWidget(
            players: room?.players ?? [],
            host: room?.host ?? Player(""),
            currentPlayer: player ?? Player(""),
          ),
        ],
      ),
      children: [
        SizedBox(height: 0),
        room != null
            ? BingoFieldWidget(
              tiles: _tiles,
              size: room?.tileset.size ?? 5,
              checkedTiles: _checked,
              tileBuilder: CheckableTileWidget.tileBuilder(_handleCheckChange),
            )
            : SizedBox(height: 0),
        _buildCheckButton(),
      ],
    );
  }
}
