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
  static Color retry = Colors.lightBlue;
  static Color focus = primary;

  static Color dialogBackground = Colors.deepPurple[300]!;
  static Color cardBackground = Colors.white;
  static Color tooltipBackground = Colors.grey[800]!;
  static Color appBarBackground = Colors.deepPurpleAccent[400]!;

  static Color settingsButtonBackground = Colors.grey[300]!;

  static Color playersButtonBackground = Colors.grey[700]!;

  static Color backButtonBackground = Colors.orange[300]!;

  static Color inputFieldBackground = Colors.deepPurple[400]!;
  static Color inputFieldBorder = Colors.white;
  static Color inputFieldHintText = Colors.grey;

  static Color rateIconColor = Colors.yellow[600]!;
  static Color playsIconColor = Colors.red[400]!;

  static Color mainMenuCreateRoomButtonBackground = Colors.yellow;
  static Color mainMenuJoinRoomButtonBackground = Colors.pinkAccent;
  static Color mainMenuCreateCardButtonBackground = Colors.lightBlue[300]!;
  static Color mainMenuViewCardsButtonBackground = Colors.deepPurpleAccent;

  static Color bingoTileBackground = Colors.blue[100]!;
  static Color bingoTileBorder = Colors.blue[400]!;

  static Color winnerColor = Colors.yellow[600]!;
  static Color winnerSelfColor = primary;
  static Color hostColor = Colors.blue;
  static Color selfColor = primary;

  static Color getContrastingColor(Color color) {
    double luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
