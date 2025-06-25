import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

// Only to define global theme colors that should also affect the material widgets
ThemeData getTheme() {
  return ThemeData.dark().copyWith(
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          AppColors.getContrastingColor(AppColors.primary),
        ),
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
        foregroundColor: WidgetStateProperty.all(
          AppColors.getContrastingColor(AppColors.primary),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyles.button(
            color: AppColors.getContrastingColor(AppColors.primary),
          ),
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
      labelStyle: TextStyles.normal(
        color: AppColors.getContrastingColor(AppColors.inputFieldBackground),
      ),
      hintStyle: TextStyles.normal(color: AppColors.inputFieldHintText),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: Spacings.roundBorderExtraLarge,
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      labelStyle: TextStyles.small(
        color: AppColors.getContrastingColor(AppColors.primary),
      ),
      deleteIconColor: AppColors.error,
    ),
    tooltipTheme: TooltipThemeData(
      textStyle: TextStyles.small(
        color: AppColors.getContrastingColor(AppColors.tooltipBackground),
      ),
      decoration: BoxDecoration(
        color: AppColors.tooltipBackground,
        borderRadius: Spacings.roundBorderSmall,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Spacings.small,
        horizontal: Spacings.medium,
      ),
    ),
  );
}
