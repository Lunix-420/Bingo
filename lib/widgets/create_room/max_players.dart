import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxPlayersWidget extends StatelessWidget {
  final TextEditingController controller;

  const MaxPlayersWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Max Players',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the maximum number of players';
        }
        final int? maxPlayers = int.tryParse(value);
        if (maxPlayers == null || maxPlayers <= 0 || maxPlayers > 16) {
          return 'Please enter a valid number of players (1-16)';
        }
        return null;
      },
    );
  }
}
