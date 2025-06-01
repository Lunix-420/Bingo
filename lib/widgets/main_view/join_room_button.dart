import 'package:flutter/material.dart';
import 'package:frontend/views/join_room_overlay.dart';
import '../custom_button.dart';

class JoinRoomButton extends StatelessWidget {
  const JoinRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCustomButton(
      color: Colors.greenAccent,
      label: 'JOIN ROOM',
      isWideButton: true,
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