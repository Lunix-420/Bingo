import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Animation<double> animation;

  const LogoWidget({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            'images/br_logo.png',
            scale: 2.1,
          ),
        ),
      ),
    );
  }
}