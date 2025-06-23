import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';

// Only to define global theme colors that should also affect the material widgets
ThemeData getTheme() {
  return ThemeData.dark().copyWith(
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: Spacings.roundBorderExtraLarge),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: Spacings.roundBorderLarge),
    ),
  );
}
