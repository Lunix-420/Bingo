import 'package:flutter/material.dart';
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
      appbar: AppBarWidget(title: 'Bingo Royale', isHome: true),
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
