import 'package:flutter/material.dart';
import 'package:frontend/router/router.dart';
import 'package:frontend/theme/theme.dart';
import 'package:toastification/toastification.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: "Bingo Royal",
        theme: getTheme(),
        routes: buildAppRoutes(),
        initialRoute: "/create",
      ),
    );
  }
}
