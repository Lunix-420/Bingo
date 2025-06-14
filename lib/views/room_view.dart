import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/game/player_list_button.dart';
import 'package:frontend/widgets/room/code_display.dart';
import 'package:frontend/widgets/room/room_settings_display.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:frontend/widgets/custom_button.dart';

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  Room? room;
  Player? player;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        setState(() {
          room = args["room"] as Room?;
          player = args["player"] as Player?;
        });
        if (room == null) {
          Navigator.pushNamed(context, "/");
        }
      } else {
        Navigator.pushNamed(context, "/");
      }
    });
  }

  bool get isHost {
    if (room == null || player?.id == null) return false;
    return room!.host.id == player!.id;
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
          ? CustomButton(
            color: Colors.greenAccent,
            label: "Start Game",
            isWideButton: true,
            onPressed: () {
              // TODO: Implement start game logic
            },
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
