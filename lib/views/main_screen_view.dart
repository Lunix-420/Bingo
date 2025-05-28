import 'package:flutter/material.dart';
import 'package:frontend/services/menu_button_service.dart';
import 'package:frontend/widgets/main_screen/menu.dart';
import 'package:frontend/widgets/main_screen/logo_widget.dart';
import 'package:frontend/widgets/settings_button.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenView>
    with TickerProviderStateMixin {
  late AnimationController logoController;
  late AnimationController buttonsController;
  late AnimationController settingsController;

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
    settingsController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
    );

    logoController.forward().then((_) {
      buttonsController.forward().then((_) {
        settingsController.forward();
      });
    });
  }

  @override
  void dispose() {
    logoController.dispose();
    buttonsController.dispose();
    settingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFFA552E6),
              Color(0xFF560ADE),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SettingsButton(
                animation: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: settingsController,
                      curve: Curves.easeOutBack,
                  ),
                ),
                onPressed: () {
                  // Handle settings
                },
              ),
              LogoWidget(
                animation: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: logoController,
                      curve: Curves.easeOutBack,
                  ),
                ),
              ),
              ButtonsBox(
                animation: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: buttonsController,
                      curve: Curves.easeOutBack,
                  ),
                ),
                onPressed: (index) {
                  MenuButtonService.handleMenuButtonPressed(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}