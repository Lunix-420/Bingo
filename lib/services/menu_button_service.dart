import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

class MenuButtonService {
  static void handleMenuButtonPressed(int index) {
    switch (index) {
      case 0:
        _createRoom();
        break;
      case 1:
        _joinRoom();
        break;
      case 2:
        _createCard();
        break;
      case 3:
        _viewCards();
        break;
      default:
        if (kDebugMode) {
          debugPrint('Unhandled button index: $index');
        }
    }
  }
}

void _viewCards() {
}

void _createCard() {
}

void _joinRoom() {
}

void _createRoom() {
}