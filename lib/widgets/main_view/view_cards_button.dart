import 'package:flutter/material.dart';
import '../custom_button.dart';

class ViewCardsButton extends StatelessWidget {
  const ViewCardsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.orangeAccent,
      label: 'VIEW CARDS',
      isWideButton: true,
      onPressed:
          // () => Navigator.pushNamed(
          //   context,
          //   '/preview',
          //   arguments: {"id": "68415b104de6646d1a9cc68f"},
          // ),
          () => Navigator.pushNamed(context, "/list"),
    );
  }
}
