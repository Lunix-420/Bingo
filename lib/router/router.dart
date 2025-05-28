import 'package:flutter/material.dart';
import 'package:frontend/views/card_preview_view.dart';
import 'package:frontend/views/main_screen_view.dart';
import 'package:frontend/views/testfield.dart';

/// A function to define the routes for the application.
Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/": (context) => const Scaffold(body: Center(child: Text("Home"))),
    "/main": (context) => const MainScreenView(),
    "/test": (context) => const TestFieldView(),
    "/preview": (context) => const CardPreviewView(),
  };
}
