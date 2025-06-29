import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Animation<double> animation;

  const Logo({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.height / 350.0;
    return Align(
      alignment: Alignment.topCenter,
      child: ScaleTransition(
        scale: animation,
        child: Image.asset('images/br_logo.png', scale: scale),
      ),
    );
  }
}
