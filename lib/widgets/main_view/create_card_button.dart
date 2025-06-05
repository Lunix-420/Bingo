import 'package:flutter/material.dart';
import 'menu_button.dart';

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
      onPressed: () => handleNagivation(context),
    );
  }
}
