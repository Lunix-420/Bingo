import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

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
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: Spacings.roundBorderMedium),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: Spacings.roundBorderMedium),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFieldBackground,
      border: OutlineInputBorder(
        borderRadius: Spacings.roundBorderSmall,
        borderSide: BorderSide(color: AppColors.inputFieldBorder, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: Spacings.roundBorderSmall,
        borderSide: BorderSide(color: AppColors.inputFieldBorder, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: Spacings.roundBorderSmall,
        borderSide: BorderSide(color: AppColors.inputFieldBorder, width: 2),
      ),
      labelStyle: TextStyles.normal(color: AppColors.inputFieldText),
      hintStyle: TextStyles.normal(color: AppColors.inputFieldHintText),
    ),
  );
}
