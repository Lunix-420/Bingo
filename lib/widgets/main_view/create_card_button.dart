import 'package:flutter/material.dart';
import '../custom_button.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCustomButton(
      color: Colors.blueAccent,
      label: 'CREATE CARD',
      isWideButton: true,
      onPressed: () {
        // TODO
      },
    );
  }
}