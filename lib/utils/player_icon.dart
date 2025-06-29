import "package:flutter/material.dart";
import "package:frontend/theme/colors.dart";

class PlayerIcon {
  static Icon getSelf({bool host = false}) {
    return Icon(host ? Icons.star : Icons.person, color: AppColors.selfColor);
  }

  static Icon getHost() {
    return Icon(Icons.star, color: AppColors.hostColor);
  }

  static Icon getWinner() {
    return Icon(Icons.star, color: AppColors.winnerColor);
  }

  static Icon getWinnerSelf() {
    return Icon(Icons.star, color: AppColors.winnerSelfColor);
  }

  static Icon getDefault() {
    return const Icon(Icons.person_outline);
  }
}
