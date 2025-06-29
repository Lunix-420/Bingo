import 'package:flutter/material.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/utils/player_icon.dart';
import '../../theme/decorations.dart';
import '../../theme/spacings.dart';
import '../../model/player_model.dart';
import '../../model/room_model.dart';

class ScoreboardWidget extends StatelessWidget {
  final Room room;
  final Player player;

  const ScoreboardWidget({super.key, required this.room, required this.player});

  Player _getWinner() {
    Player? winner;
    for (final field in room.bingofields) {
      if (field.isWinner) {
        winner = room.players.firstWhere((p) => p.id == field.playerId);
        break;
      }
    }
    return winner ?? player;
  }

  List<Player> _getOrderedPlayers(Player winner) {
    final isCurrentPlayerWinner = player.id == winner.id;
    final others =
        room.players
            .where((p) => p.id != winner.id && p.id != player.id)
            .toList();
    return [winner, if (!isCurrentPlayerWinner) player, ...others];
  }

  @override
  Widget build(BuildContext context) {
    final winner = _getWinner();
    final orderedPlayers = _getOrderedPlayers(winner);

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: Spacings.allMedium,
        decoration: Decorations.card,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...orderedPlayers.map((p) {
              Icon? leadingIcon;
              if (p == winner && p == player) {
                leadingIcon = PlayerIcon.getWinnerSelf();
              } else if (p == winner) {
                leadingIcon = PlayerIcon.getWinner();
              } else if (p == player) {
                leadingIcon = PlayerIcon.getSelf();
              }
              return ListTile(
                leading: leadingIcon,
                title: Text(p.name, style: TextStyles.normal()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
