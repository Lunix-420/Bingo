import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/utils/player_icon.dart';

void main() {
  group('PlayerIcon', () {
    test('getSelf returns correct icon', () {
      final icon = PlayerIcon.getSelf();
      expect(icon.icon, Icons.person);
      expect(icon.color, AppColors.selfColor);

      final hostIcon = PlayerIcon.getSelf(host: true);
      expect(hostIcon.icon, Icons.star);
      expect(hostIcon.color, AppColors.selfColor);
    });

    test('getHost returns correct icon', () {
      final icon = PlayerIcon.getHost();
      expect(icon.icon, Icons.star);
      expect(icon.color, AppColors.hostColor);
    });

    test('getWinner returns correct icon', () {
      final icon = PlayerIcon.getWinner();
      expect(icon.icon, Icons.star);
      expect(icon.color, AppColors.winnerColor);
    });

    test('getWinnerSelf returns correct icon', () {
      final icon = PlayerIcon.getWinnerSelf();
      expect(icon.icon, Icons.star);
      expect(icon.color, AppColors.winnerSelfColor);
    });

    test('getDefault returns correct icon', () {
      final icon = PlayerIcon.getDefault();
      expect(icon.icon, Icons.person_outline);
      expect(icon.color, isNull);
    });
  });
}
