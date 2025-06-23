import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle title({Color? color}) => TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: color ?? Colors.black,
  );

  static TextStyle normal({Color? color}) =>
      TextStyle(fontSize: 16.0, color: color ?? Colors.black);

  static TextStyle small({Color? color}) =>
      TextStyle(fontSize: 14.0, color: color ?? Colors.black);

  static TextStyle code() => TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
