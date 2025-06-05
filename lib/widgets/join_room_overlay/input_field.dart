import 'package:flutter/material.dart';

class JoinRoomInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const JoinRoomInputWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.black
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        hintStyle: const TextStyle(
            color: Colors.black54
        ),
        filled: true,
        fillColor: Colors.purpleAccent.shade100,
      ),
    );
  }
}
