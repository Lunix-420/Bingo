import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

class Toast {
  static void show(String title, String message, ToastificationType type) {
    toastification.show(
      title: Text(title),
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: Duration(seconds: 5),
      description: Text(message),
      alignment: Alignment.bottomLeft,
    );
  }
}
