import 'package:flutter/material.dart';
import 'menu_button.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildButton(
      color: Colors.redAccent,
      label: 'CREATE ROOM',
      onPressed: () {
        // TODO
      },
    );
  }
}
