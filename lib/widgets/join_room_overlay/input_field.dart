import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const InputField({
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
        fillColor: const Color(0xFFC193CC),
      ),
    );
  }
}
