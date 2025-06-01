import 'package:flutter/material.dart';

import '../custom_button.dart';

class JoinButton extends StatelessWidget {
  final String roomName;
  final String roomCode;

  const JoinButton({
    super.key,
    required this.roomName,
    required this.roomCode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.lightGreenAccent,
      label: 'JOIN',
      isWideButton: false,
      onPressed: () {
        // TODO
      },
    );
  }
}