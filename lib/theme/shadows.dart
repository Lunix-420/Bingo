import 'package:flutter/material.dart';

class Shadows {
  static const BoxShadow codeDisplay = BoxShadow(
    color: Colors.black12,
    blurRadius: 4.0,
    offset: Offset(0, 2),
  );

  static const BoxShadow scoreboard = BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const List<BoxShadow> menuButton = [
    BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4),
    BoxShadow(color: Color(0x99FFFFFF), offset: Offset(-2, -2), blurRadius: 4),
  ];

  static const BoxShadow cardShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 6,
    offset: Offset(0, 3),
  );
}
