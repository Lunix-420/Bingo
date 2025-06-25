import 'package:flutter/material.dart';

class Spacings {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  static const allSmall = EdgeInsets.all(small);
  static const allMedium = EdgeInsets.all(medium);
  static const allLarge = EdgeInsets.all(large);
  static const allExtraLarge = EdgeInsets.all(extraLarge);
  static const verticalMedium = EdgeInsets.symmetric(vertical: medium);
  static const horizontalSmall = EdgeInsets.symmetric(horizontal: small);

  static const roundBorderMedium = BorderRadius.all(Radius.circular(medium));
  static const roundBorderSmall = BorderRadius.all(Radius.circular(small));
  static const roundBorderLarge = BorderRadius.all(Radius.circular(large));
  static const roundBorderExtraLarge = BorderRadius.all(
    Radius.circular(extraLarge),
  );
}
