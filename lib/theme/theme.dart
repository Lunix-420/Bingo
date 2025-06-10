import 'package:flutter/material.dart';

// Only to define global theme colors that should also affect the material widgets
ThemeData getTheme() {
  const primary = Colors.deepPurple;
  const secondary = Colors.amber;

  return ThemeData.dark().copyWith(
    primaryColor: primary,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
      primary: primary,
      secondary: secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.deepPurple.shade400,
    ),
  );
}
