import 'package:flutter/material.dart';
import '../custom_button.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({super.key});

  void _handleNagivation(BuildContext context) {
    Navigator.of(context).pushNamed('/create-card');
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.blueAccent,
      label: 'CREATE CARD',
      isWideButton: true,
      onPressed: () => _handleNagivation(context),
    );
  }
}
