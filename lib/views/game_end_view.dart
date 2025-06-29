import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/score/scoreboard.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

class GameEndView extends StatefulWidget {
  const GameEndView({super.key});

  @override
  State<GameEndView> createState() => _GameEndViewState();
}

class _GameEndViewState extends State<GameEndView> {
  Room? room;
  Player? player;
  bool hasLiked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        room = Routing.getRoomFromArguments(context);
        player = Routing.getPlayerFromArguments(context);
      });
    });
  }

  Tileset get tileset {
    if (room == null) {
      return Tileset();
    }
    return room!.tileset;
  }

  void _handleTilesetTap(Tileset tileset) {
    if (room == null) {
      return;
    }
    if (hasLiked) {
      TilesetService.downvoteTileset(room!.tileset).then((tileset) {
        if (tileset != null) {
          setState(() {
            room!.tileset = tileset;
            hasLiked = false;
          });
          Toast.show(
            "Success",
            "Successfully unliked the Bingo Card!",
            ToastificationType.success,
          );
        }
      });
    } else {
      TilesetService.upvoteTileset(room!.tileset).then((tileset) {
        if (tileset != null) {
          setState(() {
            room!.tileset = tileset;
            hasLiked = true;
          });
          Toast.show(
            "Success",
            "Successfully liked the Bingo Card!",
            ToastificationType.success,
          );
        }
      });
    }
  }

  ScoreboardWidget? get scoreboard {
    if (room == null || player == null) {
      return null;
    }
    return ScoreboardWidget(room: room!, player: player!);
  }

  void _navigateToHome() {
    Routing.navigateHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Score", routeName: Routing.homeRoute),
      children: [
        BingoPreviewCardWidget(tileset: tileset, onTap: _handleTilesetTap),
        scoreboard ?? const SizedBox.shrink(),
        ElevatedButton(
          onPressed: _navigateToHome,
          style: ButtonStyles.successButton,
          child: const Text("Finish"),
        ),
      ],
    );
  }
}
