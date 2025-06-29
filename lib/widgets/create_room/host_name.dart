import 'package:flutter/material.dart';

class HostNameWidget extends StatelessWidget {
  final TextEditingController controller;

  const HostNameWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Owner Name',
        hint: const Text("Enter your name..."),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid username for the owner';
        }
        return null;
      },
    );
  }
}
