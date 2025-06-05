import 'package:flutter/material.dart';
import '../custom_button.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({super.key});

  void handleNagivation(BuildContext context) {
    Navigator.of(context).pushNamed('/create');
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.blueAccent,
      label: 'CREATE CARD',
      isWideButton: true,
      onPressed: () => handleNagivation(context),
    );
  }
}
