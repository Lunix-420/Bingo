import 'package:flutter/material.dart';

class AppColors {
  static RadialGradient background = RadialGradient(
    center: Alignment.center,
    radius: 0.75,
    colors: [Colors.deepPurpleAccent[100]!, Colors.deepPurple[600]!],
  );

  static Color defaultText = Colors.black;

  static Color primary = Colors.deepPurple;
  static Color secondary = Colors.blue;
  static Color success = Colors.lightGreenAccent[400]!;
  static Color error = Colors.red;
  static Color disabled = Colors.grey[400]!;
  static Color retry = Color.fromARGB(255, 20, 242, 246);
  static Color focus = primary;

  static Color dialogBackground = Colors.deepPurple[300]!;
  static Color cardBackground = Color(0xFFFFFEFF);
  static Color tooltipBackground = Color(0xFF333333);
  static Color appBarBackground = Colors.deepPurpleAccent[400]!;

  static Color settingsButtonBackground = Colors.grey[300]!;

  static Color playersButtonBackground = Color(0xFF1F1F1F);

  static Color backButtonBackground = Colors.orange[300]!;

  static Color inputFieldBackground = Colors.deepPurple[400]!;
  static Color inputFieldBorder = Colors.white;
  static Color inputFieldHintText = Color(0xFF9E9E9E);

  static Color rateIconColor = Colors.yellow;
  static Color playsIconColor = Colors.red[400]!;

  static Color mainMenuCreateRoomButtonBackground = Color(0xFFFFDB0A);

  static Color mainMenuJoinRoomButtonBackground = Color(0xFFFC8AFF);

  static Color mainMenuCreateCardButtonBackground = Color(0xFF4CDAFE);

  static Color mainMenuViewCardsButtonBackground = Color(0xFFC286FF);

  static Color getContrastingColor(Color color) {
    double luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
