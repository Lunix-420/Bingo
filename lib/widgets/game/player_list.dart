import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/utils/player_icon.dart';

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

  Icon _getPlayerIcon(Player player) {
    if (player.id == currentPlayer.id) {
      if (player.id == host.id) {
        return PlayerIcon.getSelf(host: true);
      }
      return PlayerIcon.getSelf();
    } else if (player.id == host.id) {
      return PlayerIcon.getHost();
    } else {
      return PlayerIcon.getDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(players[index].name, style: TextStyles.normal()),
          leading: _getPlayerIcon(players[index]),
        );
      },
    );
  }
}
