import 'package:flutter/material.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/views/card_create_view.dart';
import 'package:frontend/views/card_edit_view.dart';
import 'package:frontend/views/card_list_view.dart';
import 'package:frontend/views/card_preview_view.dart';
import 'package:frontend/views/game_end_view.dart';
import 'package:frontend/views/game_view.dart';
import 'package:frontend/views/main_view.dart';
import 'package:frontend/views/room_create_view.dart';
import 'package:frontend/views/room_view.dart';

/// A function to define the routes for the application.
Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/":
        (context) => const Scaffold(
          body: Center(child: Text("You Should not be here!")),
        ),
    Routing.homeRoute: (context) => const MainView(),
    Routing.cardPreviewRoute: (context) => const CardPreviewView(),
    Routing.cardCreateRoute: (context) => const CardCreateView(),
    Routing.cardEditRoute: (context) => const CardEditView(),
    Routing.cardListRoute: (context) => const CardListView(),
    Routing.roomCreateRoute: (context) => const RoomCreateView(),
    Routing.roomRoute: (context) => const RoomView(),
    Routing.gameRoute: (context) => const GameView(),
    Routing.gameEndRoute: (context) => const GameEndView(),
  };
}
