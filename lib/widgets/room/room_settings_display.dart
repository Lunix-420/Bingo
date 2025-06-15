import 'package:flutter/material.dart';
import 'package:frontend/model/room_model.dart';

class RoomSettingsDisplayWidget extends StatelessWidget {
  final Room room;

  const RoomSettingsDisplayWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Room Settings",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(children: [Text("Host Name: ${room.host.name}")]),
            Row(
              children: [
                Text("${room.players.length} of ${room.maxPlayers} Players"),
              ],
            ),
            Row(
              children: [Text(room.isVersus ? "Mode: Versus" : "Mode: Co-op")],
            ),
          ],
        ),
      ),
    );
  }
}
