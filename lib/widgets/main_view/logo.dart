import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Animation<double> animation;

  const Logo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ScaleTransition(
        scale: animation,
        child: Image.asset(
          'images/br_logo.png',
          scale: 2.1,
        ),
      ),
    );
  }
}