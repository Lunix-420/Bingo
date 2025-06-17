import 'package:flutter/material.dart';
import 'package:frontend/model/bingo_field_model.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
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
  }

  void handleFocusChange() {
    // --
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

  void handleCheckChange(int index) {}

  void handleButtonPress() {
    final node = FocusManager.instance.primaryFocus;
    if (node != null && node is CheckableFieldWidget) {
      final field = node as CheckableFieldWidget;
      field.index;
    }
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
            host: room?.host ?? Player(),
            currentPlayer: player ?? Player(),
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
              tileBuilder: CheckableFieldWidget.tileBuilder(handleCheckChange),
            )
            : SizedBox(height: 0),
        ElevatedButton(
          onPressed: handleButtonPress,
          child: const Text("Check"),
        ),
      ],
    );
  }
}
