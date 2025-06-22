import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/score/scoreboard.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

final logger = namedLogger("Game-End-View");

class GameEndView extends StatefulWidget {
  const GameEndView({super.key});

  @override
  State<GameEndView> createState() => _GameEndViewState();
}

class _GameEndViewState extends State<GameEndView> {
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
  }

  Tileset get tileset {
    if (room == null) {
      return Tileset();
    }
    return room!.tileset;
  }

  void handleTilesetTap(Tileset tileset) {
    // TODO:
  }

  ScoreboardWidget? get scoreboard {
    if (room == null || player == null) {
      return null;
    }
    return ScoreboardWidget(room: room!, player: player!);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Score", routeName: "/home"),
      children: [
        BingoPreviewCardWidget(tileset: tileset, onTap: handleTilesetTap),
        scoreboard ?? const SizedBox.shrink(),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          child: const Text("Finish"),
        ),
      ],
    );
  }
}
