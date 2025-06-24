import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/widgets/join_room_overlay/join_room_dialog.dart';
import 'package:frontend/widgets/main_view/menu_button.dart';

class Menu extends StatelessWidget {
  final Animation<double> animation;

  const Menu({super.key, required this.animation});

  void _navigateToCreateRoom(BuildContext context) {
    Navigator.of(context).pushNamed('/create-room');
  }

  void _showJoinRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const JoinRoomDialog(),
    );
  }

  void _navigateToCreateCard(BuildContext context) {
    Navigator.of(context).pushNamed('/create-card');
  }

  void _navigateToViewCards(BuildContext context) {
    Navigator.pushNamed(context, "/list");
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacings.extraLarge),
          child: Card(
            child: Padding(
              padding: Spacings.allLarge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 32,
                children: [
                  MenuButtonWidget(
                    color: AppColors.mainMenuCreateRoomButtonBackground,
                    label: Text(
                      "CREATE ROOM",
                      style: TextStyles.button(
                        color: AppColors.getContrastingColor(
                          AppColors.mainMenuCreateRoomButtonBackground,
                        ),
                      ),
                    ),
                    onPressed: () => _navigateToCreateRoom(context),
                  ),
                  MenuButtonWidget(
                    color: AppColors.mainMenuJoinRoomButtonBackground,
                    label: Text(
                      "JOIN ROOM",
                      style: TextStyles.button(
                        color: AppColors.getContrastingColor(
                          AppColors.mainMenuJoinRoomButtonBackground,
                        ),
                      ),
                    ),
                    onPressed: () => _showJoinRoomDialog(context),
                  ),
                  MenuButtonWidget(
                    color: AppColors.mainMenuCreateCardButtonBackground,
                    label: Text(
                      "CREATE CARD",
                      style: TextStyles.button(
                        color: AppColors.getContrastingColor(
                          AppColors.mainMenuCreateCardButtonBackground,
                        ),
                      ),
                    ),
                    onPressed: () => _navigateToCreateCard(context),
                  ),
                  MenuButtonWidget(
                    color: AppColors.mainMenuViewCardsButtonBackground,
                    label: Text(
                      "VIEW CARDS",
                      style: TextStyles.button(
                        color: AppColors.getContrastingColor(
                          AppColors.mainMenuViewCardsButtonBackground,
                        ),
                      ),
                    ),
                    onPressed: () => _navigateToViewCards(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
