import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';

class PlayerListWidget extends StatelessWidget {
  final List<Player> players;
  final Player host;
  final Player currentPlayer;

  const PlayerListWidget({
    super.key,
    required this.players,
    required this.host,
    required this.currentPlayer,
  });

  Icon getPlayerIcon(Player player) {
    if (player.id == currentPlayer.id) {
      if (player.id == host.id) {
        return const Icon(Icons.star, color: Colors.blue);
      }
      return const Icon(Icons.person, color: Colors.blue);
    } else if (player.id == host.id) {
      return const Icon(Icons.star, color: Colors.yellow);
    } else {
      return const Icon(Icons.person_outline);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(players[index].name),
          leading: getPlayerIcon(players[index]),
        );
      },
    );
  }
}
