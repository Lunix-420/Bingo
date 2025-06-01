import 'package:flutter/material.dart';
import '../custom_button.dart';

class ViewCardsButton extends StatelessWidget {
  const ViewCardsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCustomButton(
      color: Colors.orangeAccent,
      label: 'VIEW CARDS',
      isWideButton: true,
      onPressed: () {
        // TODO
      },
    );
  }
}