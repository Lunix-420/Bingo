import 'package:flutter/material.dart';
import '../../theme/textstyles.dart';
import '../../theme/spacings.dart';
import '../../model/room_model.dart';

class RoomSettingsDisplayWidget extends StatelessWidget {
  final Room room;

  const RoomSettingsDisplayWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Spacings.allMedium,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Room Settings", style: TextStyles.title())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Owner Name: ${room.host.name}",
                  style: TextStyles.normal(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${room.players.length} of ${room.maxPlayers} Players",
                  style: TextStyles.normal(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  room.isVersus ? "Mode: Versus" : "Mode: Co-op",
                  style: TextStyles.normal(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
