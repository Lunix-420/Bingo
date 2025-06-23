import 'package:flutter/material.dart';

class AppColors {
  static RadialGradient background = RadialGradient(
    center: Alignment.center,
    radius: 0.75,
    colors: [Colors.deepPurpleAccent[100]!, Colors.deepPurple[600]!],
  );

  static Color primary = Color(0xFF9F51FE);
  static Color success = Color(0xFF4CAF50);
  static Color error = Color(0xFFF44336);
  static Color retry = Color.fromARGB(255, 20, 242, 246);
  static Color focus = primary;

  static Color dialogBackground = Color(0xFF121212);
  static Color cardBackground = Color(0xFFFFFEFF);
  static Color tooltipBackground = Color(0xFF333333);
  static Color appBarBackground = Colors.deepPurpleAccent[400]!;

  static Color settingsButtonBackground = Colors.grey[300]!;
  static Color settingsButtonForeground = Colors.black;

  static Color playersButtonBackground = Color(0xFF1F1F1F);
  static Color playersButtonForeground = Color(0xFFB0BEC5);

  static Color backButtonBackground = Colors.orange[300]!;
  static Color backButtonForeground = Colors.black;

  static Color inputFieldBackground = Color(0xFF2C2C2C);
  static Color inputFieldText = Color(0xFFE0E0E0);
  static Color inputFieldBorder = Color(0xFF424242);
  static Color inputFieldHintText = Color(0xFF9E9E9E);

  static Color bingoFieldBackground = Color(0xFF2C2C2C);
  static Color bingoFieldText = Color(0xFFE0E0E0);

  static Color ratedRateIconColor = Color(0xFF4CAF50);
  static Color unratedRateIconColor = Color(0xFFF44336);
  static Color playsIconColor = Color(0xFFB0BEC5);

  static Color mainMenuCreateRoomButtonBackground = Color(0xFFFFDB0A);
  static Color mainMenuCreateRoomButtonForeground = Colors.black;

  static Color mainMenuJoinRoomButtonBackground = Color(0xFFFC8AFF);
  static Color mainMenuJoinRoomButtonForeground = Colors.black;

  static Color mainMenuCreateCardButtonBackground = Color(0xFF4CDAFE);
  static Color mainMenuCreateCardButtonForeground = Colors.black;

  static Color mainMenuViewCardsButtonBackground = Color(0xFFC286FF);
  static Color mainMenuViewCardsButtonForeground = Colors.black;
}
