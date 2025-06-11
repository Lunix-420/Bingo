import 'package:flutter/material.dart';
import '../custom_button.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  void _handleNagivation(BuildContext context) {
    Navigator.of(context).pushNamed('/create-room');
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.redAccent,
      label: 'CREATE ROOM',
      isWideButton: true,
      onPressed: () => _handleNagivation(context),
    );
  }
}
