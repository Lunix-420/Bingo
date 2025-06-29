import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Animation<double> animation;

  const Logo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    final scale = (5.5 - (MediaQuery.of(context).size.height / 250.0)).clamp(
      1.0,
      5.5,
    );
    return Align(
      alignment: Alignment.topCenter,
      child: ScaleTransition(
        scale: animation,
        child: Image.asset('images/br_logo.png', scale: scale),
      ),
    );
  }
}
