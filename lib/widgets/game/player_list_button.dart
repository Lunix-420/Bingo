import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/widgets/game/player_list_modal.dart';

class PlayerListButtonWidget extends StatelessWidget {
  final List<Player> players;
  final Player host;
  final Player currentPlayer;

  const PlayerListButtonWidget({
    super.key,
    required this.players,
    required this.host,
    required this.currentPlayer,
  });

  void _showPlayerList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PlayerListModalWidget(
          players: players,
          host: host,
          currentPlayer: currentPlayer,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.people, color: AppColors.playersButtonForeground),
      tooltip: 'Show Players',
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.playersButtonBackground,
        ),
      ),
      onPressed: () => _showPlayerList(context),
    );
  }
}
