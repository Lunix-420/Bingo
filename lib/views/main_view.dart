import 'package:flutter/material.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/views/game_view.dart';
import 'package:frontend/views/room_view.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/main_view/menu.dart';
import 'package:frontend/widgets/main_view/logo.dart';
import 'package:frontend/widgets/view_scaffold.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late AnimationController logoController;
  late AnimationController buttonsController;

  @override
  void initState() {
    super.initState();
    GameService.removeListeners();
    GameService.disconnectSocket();
    if (RoomView.navigated || GameView.navigated) {
      RoomView.navigated = false;
      RoomView.connected = false;
      GameView.navigated = false;
    }
    RoomView.navigated = false;
    RoomView.connected = false;
    GameView.navigated = false;

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    buttonsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    logoController.forward().then((_) {
      buttonsController.forward().then((_) {});
    });
  }

  @override
  void dispose() {
    logoController.dispose();
    buttonsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: 'BINGO ROYAL', isHome: true),
      children: [
        Logo(
          animation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: logoController, curve: Curves.easeOutBack),
          ),
        ),
        Menu(
          animation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: buttonsController,
              curve: Curves.easeOutBack,
            ),
          ),
        ),
      ],
    );
  }
}
