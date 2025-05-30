import 'package:flutter/material.dart';
import 'menu_button.dart';

class JoinRoomButton extends StatelessWidget {
  const JoinRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMenuButton(
      color: Colors.greenAccent,
      label: 'JOIN ROOM',
      onPressed: () {
        // TODO
      },
    );
  }
}