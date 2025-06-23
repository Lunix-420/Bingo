import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/shadows.dart';
import 'package:frontend/theme/spacings.dart';

class Decorations {
  static BoxDecoration codeDisplay = BoxDecoration(
    color: AppColors.primary,
    borderRadius: Spacings.roundBorderExtraLarge,
    border: BoxBorder.all(color: Colors.white, width: 2),
    boxShadow: [Shadows.cardShadow],
  );

  static BoxDecoration menuButton = BoxDecoration(
    borderRadius: Spacings.roundBorderMedium,
    boxShadow: const [
      BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4),
      BoxShadow(
        color: Color(0x99FFFFFF),
        offset: Offset(-2, -2),
        blurRadius: 4,
      ),
    ],
  );

  static BoxDecoration card = BoxDecoration(
    color: Colors.white,
    borderRadius: Spacings.roundBorderLarge,
    boxShadow: [Shadows.cardShadow],
  );
}
