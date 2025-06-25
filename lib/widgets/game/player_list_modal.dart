import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/widgets/game/player_list.dart';

class PlayerListModalWidget extends StatelessWidget {
  final List<Player> players;
  final Player host;
  final Player currentPlayer;

  const PlayerListModalWidget({
    super.key,
    required this.players,
    required this.host,
    required this.currentPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Detect taps outside the drawer
        GestureDetector(
          onTap: () => Routing.navigateBack(context),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: double.infinity,
            decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
            child: Column(
              spacing: Spacings.large,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Spacings.extraLarge,
                    vertical: Spacings.large,
                  ),
                  child: Row(
                    spacing: Spacings.extraLarge,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.backButtonBackground,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            AppColors.getContrastingColor(
                              AppColors.backButtonBackground,
                            ),
                          ),
                        ),
                        tooltip: 'Back',
                        onPressed: () => Routing.navigateBack(context),
                      ),
                      Text('PLAYERS', style: TextStyles.title()),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacings.large),
                    child: PlayerListWidget(
                      players: players,
                      host: host,
                      currentPlayer: currentPlayer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
