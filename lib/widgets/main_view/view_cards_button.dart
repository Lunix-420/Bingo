import 'package:flutter/material.dart';
import 'menu_button.dart';

class ViewCardsButton extends StatelessWidget {
  const ViewCardsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMenuButton(
      color: Colors.orangeAccent,
      label: 'VIEW CARDS',
      onPressed: () {
        // TODO
      },
    );
  }
}