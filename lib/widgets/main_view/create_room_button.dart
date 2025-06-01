import 'package:flutter/material.dart';
import '../custom_button.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCustomButton(
      color: Colors.redAccent,
      label: 'CREATE ROOM',
      isWideButton: true,
      onPressed: () {
        // TODO
      },
    );
  }
}
