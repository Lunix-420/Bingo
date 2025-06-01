import 'package:flutter/material.dart';
import 'package:frontend/views/join_room_overlay.dart';
import 'menu_button.dart';

class JoinRoomButton extends StatelessWidget {
  const JoinRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildButton(
      color: Colors.greenAccent,
      label: 'JOIN ROOM',
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => const JoinRoomOverlay(),
        );
      },
    );
  }
}