import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/score/scoreboard.dart';
import 'package:frontend/widgets/view_scaffold.dart';

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

  void handleTilesetTap(Tileset tileset) {
    // TODO:
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
        BingoPreviewCardWidget(tileset: tileset, onTap: handleTilesetTap),
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
