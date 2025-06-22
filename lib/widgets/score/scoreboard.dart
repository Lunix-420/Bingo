import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';

class ScoreboardWidget extends StatelessWidget {
  final Room room;
  final Player player;

  const ScoreboardWidget({super.key, required this.room, required this.player});

  Player getWinner() {
    Player? winner;
    for (final field in room.bingofields) {
      if (field.isWinner) {
        winner = room.players.firstWhere((p) => p.id == field.playerId);
        break;
      }
    }
    return winner ?? player;
  }

  @override
  Widget build(BuildContext context) {
    final winner = getWinner();
    final isCurrentPlayerWinner = player.id == winner.id;
    // Remove winner and current player from the list, then add them at the top
    final others =
        room.players
            .where((p) => p.id != winner.id && p.id != player.id)
            .toList();
    final List<Player> orderedPlayers = [
      winner,
      if (!isCurrentPlayerWinner) player,
      ...others,
    ];

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...orderedPlayers.map((p) {
              Icon? leadingIcon;
              if (p == winner && p == player) {
                leadingIcon = const Icon(Icons.star, color: Colors.purple);
              } else if (p == winner) {
                leadingIcon = const Icon(Icons.star, color: Colors.yellow);
              } else if (p == player) {
                leadingIcon = const Icon(Icons.star, color: Colors.blue);
              }
              return ListTile(leading: leadingIcon, title: Text(p.name));
            }),
          ],
        ),
      ),
    );
  }
}
