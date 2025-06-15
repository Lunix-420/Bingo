import 'package:flutter/material.dart';
import 'package:frontend/views/card_create_view.dart';
import 'package:frontend/views/card_edit_view.dart';
import 'package:frontend/views/card_list_view.dart';
import 'package:frontend/views/card_preview_view.dart';
import 'package:frontend/views/main_view.dart';
import 'package:frontend/views/room_create_view.dart';
import 'package:frontend/views/room_view.dart';
import 'package:frontend/views/testfield.dart';

/// A function to define the routes for the application.
Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/": (context) => const Scaffold(body: Center(child: Text("Home"))),
    "/home": (context) => const MainView(),
    "/test": (context) => const TestFieldView(),
    "/preview": (context) => const CardPreviewView(),
    "/create-card": (context) => const CardCreateView(),
    "/edit": (context) => const CardEditView(),
    "/list": (context) => const CardListView(),
    "/create-room": (context) => const RoomCreateView(),
    "/room": (context) => const RoomView(),
  };
}
