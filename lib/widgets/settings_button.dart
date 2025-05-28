import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final Animation<double>? animation;
  final VoidCallback onPressed;

  const SettingsButton({
    super.key,
    this.animation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final button = Padding(
      padding: const EdgeInsets.all(16.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: onPressed,
        ),
      ),
    );

    return Align(
      alignment: Alignment.topRight,
      child: animation != null
          ? ScaleTransition(scale: animation!, child: button)
          : button,
    );
  }
}