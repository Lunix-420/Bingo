import 'package:flutter/material.dart';
import 'package:frontend/utils/platform.dart';

class Spacings {
  static double small = PlatformUtils.isMobile() ? 6.0 : 8.0;
  static double medium = PlatformUtils.isMobile() ? 12.0 : 16.0;
  static double large = PlatformUtils.isMobile() ? 18.0 : 24.0;
  static double extraLarge = 32.0;

  static EdgeInsets allSmall = EdgeInsets.all(small);
  static EdgeInsets allMedium = EdgeInsets.all(medium);
  static EdgeInsets allLarge = EdgeInsets.all(large);
  static EdgeInsets allExtraLarge = EdgeInsets.all(extraLarge);
  static EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: medium);
  static EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: small);

  static BorderRadius roundBorderMedium = BorderRadius.all(
    Radius.circular(medium),
  );
  static BorderRadius roundBorderSmall = BorderRadius.all(
    Radius.circular(small),
  );
  static BorderRadius roundBorderLarge = BorderRadius.all(
    Radius.circular(large),
  );
  static BorderRadius roundBorderExtraLarge = BorderRadius.all(
    Radius.circular(extraLarge),
  );
}
