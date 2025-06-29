import 'package:flutter/material.dart';
import 'package:frontend/router/router.dart';
import 'package:frontend/theme/theme.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static bool isMobile = false;

  void _initPlatform(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 1280 && size.height >= 720 ||
        size.width >= 720 && size.height >= 1280) {
      isMobile = false;
    } else {
      isMobile = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _initPlatform(context);

    return ToastificationWrapper(
      child: MaterialApp(
        title: "Bingo Royal",
        theme: getTheme(),
        routes: buildAppRoutes(),
        initialRoute: "/home",
      ),
    );
  }
}
