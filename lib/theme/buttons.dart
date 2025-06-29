import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

class ButtonStyles {
  static ButtonStyle successButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.success),
    foregroundColor: WidgetStateProperty.all(
      AppColors.getContrastingColor(AppColors.success),
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: Spacings.large,
        vertical: Spacings.medium,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: Spacings.roundBorderSmall),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyles.button(
        color: AppColors.getContrastingColor(AppColors.success),
      ),
    ),
  );

  static ButtonStyle errorButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.error),
    foregroundColor: WidgetStateProperty.all(
      AppColors.getContrastingColor(AppColors.error),
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: Spacings.large,
        vertical: Spacings.medium,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: Spacings.roundBorderSmall),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyles.button(color: AppColors.getContrastingColor(AppColors.error)),
    ),
  );

  static ButtonStyle disabledButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.disabled),
    foregroundColor: WidgetStateProperty.all(
      AppColors.getContrastingColor(AppColors.disabled),
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: Spacings.extraLarge,
        vertical: Spacings.medium,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: Spacings.roundBorderSmall),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyles.button(
        color: AppColors.getContrastingColor(AppColors.disabled),
      ),
    ),
  );

  static ButtonStyle roomCodeButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
    foregroundColor: WidgetStateProperty.all(
      AppColors.getContrastingColor(AppColors.primary),
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: Spacings.extraLarge,
        vertical: Spacings.large,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: Spacings.roundBorderExtraLarge,
        side: BorderSide(
          width: 2,
          color: AppColors.getContrastingColor(AppColors.primary),
          style: BorderStyle.solid,
        ),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyles.title(color: AppColors.getContrastingColor(AppColors.primary)),
    ),
  );

  static ButtonStyle filterIconButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
    foregroundColor: WidgetStateProperty.all(
      AppColors.getContrastingColor(AppColors.primary),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: Spacings.roundBorderExtraLarge,
        side: BorderSide(
          width: 2,
          color: AppColors.getContrastingColor(AppColors.primary),
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}
