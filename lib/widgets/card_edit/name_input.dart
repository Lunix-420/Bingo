import 'package:flutter/material.dart';

class NameInputWidget extends StatelessWidget {
  final String? name;
  final Function(String?) onNameChanged;

  /// NameInputWidget displays a text field for entering the name of a bingo card.
  const NameInputWidget({
    super.key,
    required this.name,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: name,
      decoration: const InputDecoration(
        labelText: 'Card Name',
        border: OutlineInputBorder(),
      ),
      onChanged: onNameChanged,
    );
  }
}
