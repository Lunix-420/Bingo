import 'package:flutter/material.dart';

class NameInputWidget extends StatelessWidget {
  final TextEditingController controller;

  /// NameInputWidget displays a text field for entering the name of a bingo card.
  const NameInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Card Name'),
    );
  }
}
