import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'player_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.people),
      tooltip: 'Show Players',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Stack(
              children: [
                // Detect taps outside the drawer
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: PlayerListWidget(
                      players: players,
                      host: host,
                      currentPlayer: currentPlayer,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
