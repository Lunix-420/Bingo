import 'package:flutter/material.dart';
import 'menu_button.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.blueAccent,
      label: 'CREATE CARD',
      onPressed: () {
        // TODO
      },
    );
  }
}