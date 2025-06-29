import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

class Spacings {
  static double get small => MyApp.isMobile ? 6.0 : 8.0;
  static double get medium => MyApp.isMobile ? 12.0 : 16.0;
  static double get large => MyApp.isMobile ? 18.0 : 24.0;
  static double get extraLarge => 32.0;

  static EdgeInsets get allSmall => EdgeInsets.all(small);
  static EdgeInsets get allMedium => EdgeInsets.all(medium);
  static EdgeInsets get allLarge => EdgeInsets.all(large);
  static EdgeInsets get allExtraLarge => EdgeInsets.all(extraLarge);
  static EdgeInsets get verticalMedium =>
      EdgeInsets.symmetric(vertical: medium);
  static EdgeInsets get horizontalSmall =>
      EdgeInsets.symmetric(horizontal: small);

  static BorderRadius get roundBorderMedium =>
      BorderRadius.all(Radius.circular(medium));
  static BorderRadius get roundBorderSmall =>
      BorderRadius.all(Radius.circular(small));
  static BorderRadius get roundBorderLarge =>
      BorderRadius.all(Radius.circular(large));
  static BorderRadius get roundBorderExtraLarge =>
      BorderRadius.all(Radius.circular(extraLarge));
}
