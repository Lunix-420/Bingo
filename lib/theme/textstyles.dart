import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';

class TextStyles {
  static TextStyle title({Color? color}) => TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.defaultText,
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontSize: 20.0,
    color: color ?? AppColors.defaultText,
    fontWeight: FontWeight.bold,
  );

  static TextStyle small({Color? color}) =>
      TextStyle(fontSize: 14.0, color: color ?? AppColors.defaultText);

  static TextStyle large({Color? color}) => TextStyle(
    fontSize: 28.0,
    color: color ?? AppColors.defaultText,
    fontWeight: FontWeight.bold,
  );

  static TextStyle button({Color? color}) => TextStyle(
    fontSize: 24.0,
    color: color ?? AppColors.defaultText,
    fontWeight: FontWeight.bold,
  );
}
