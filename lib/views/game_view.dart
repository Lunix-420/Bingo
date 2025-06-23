import 'package:flutter/material.dart';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/bingo_field_service.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/checkable_field.dart';
import 'package:frontend/widgets/game/player_list_button.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

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
      try {
        setState(() {
          room = RoomService.getRoomFromArguments(context);
          player = RoomService.getPlayerFromArguments(context);
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
    });
    FocusManager.instance.addListener(handleFocusChange);

    GameService.onGameUpdate(_refreshRoom);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(handleFocusChange);
    super.dispose();
  }

  Future<void> _refreshRoom(_) async {
    try {
      final updatedRoom = await RoomService.getRoomById(room!.id);
      updateRoom(updatedRoom);
    } catch (e) {
      logger.e("Error refreshing room: $e");
      Toast.show(
        "Error",
        "Failed to refresh room data.",
        ToastificationType.error,
      );
    }
  }

  void updateRoom(Room updatedRoom) {
    setState(() {
      room = updatedRoom;
    });
    final hasWon = room!.bingofields.any((f) => f.isWinner);
    if (hasWon || room!.status == RoomStatus.finished) {
      logger.i("Game finished, well done");
      Navigator.pushNamed(
        context,
        "/game-end",
        arguments: {"room": room, "player": player},
      );
    }
  }

  void handleFocusChange() {
    final node =
        FocusManager.instance.primaryFocus?.context
            ?.findAncestorWidgetOfExactType<CheckableTileWidget>();
    if (node != null) {
      setState(() {
        focusedField = node.index;
      });
    } else {
      setState(() {
        focusedField = null;
      });
    }
  }

  BingoField? get bingoField {
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

  List<String> get tiles {
    if (bingoField == null) {
      return [];
    }
    return bingoField!.tiles;
  }

  List<bool> get checked {
    if (bingoField == null) {
      return [];
    }
    return bingoField!.marked;
  }

  Future<void> handleCheckChange(int index) async {
    if (bingoField == null || player == null) {
      return;
    }
    try {
      await BingoFieldService.checkField(bingoField!, player!, index);
      updateRoom(await RoomService.getRoomById(room!.id));
    } catch (e) {
      logger.e("Error handling check change: $e");
      Toast.show(
        "Error",
        "Failed to update check state.",
        ToastificationType.error,
      );
      return;
    }
  }

  void handleButtonPress() {
    if (focusedField == null) {
      return;
    }
    handleCheckChange(focusedField!);
  }

  ElevatedButton buildCheckButton() {
    if (focusedField == null) {
      return ElevatedButton(
        onPressed: null,
        child: const Text("Please select a field"),
      );
    }
    if (focusedField! < 0 || focusedField! >= tiles.length) {
      return ElevatedButton(
        onPressed: null,
        child: const Text("Invalid field selected"),
      );
    }
    if (checked[focusedField!]) {
      return ElevatedButton(
        onPressed: handleButtonPress,
        child: const Text("Uncheck"),
      );
    }

    return ElevatedButton(
      onPressed: handleButtonPress,
      child: const Text("Check"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: "Game",
        routeName: "/home",
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
              tiles: tiles,
              size: room?.tileset.size ?? 5,
              checkedTiles: checked,
              tileBuilder: CheckableTileWidget.tileBuilder(handleCheckChange),
            )
            : SizedBox(height: 0),
        buildCheckButton(),
      ],
    );
  }
}
