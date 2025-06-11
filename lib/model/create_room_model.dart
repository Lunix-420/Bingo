import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/tileset_model.dart';

class CreateRoomModel {
  int maxPlayers;
  bool isVersus;
  String hostName;
  Tileset? tileset;

  CreateRoomModel({
    this.maxPlayers = 8,
    this.isVersus = false,
    this.hostName = "",
    this.tileset,
  });

  bool get isValid {
    return maxPlayers > 0 &&
        maxPlayers <= 16 &&
        hostName.isNotEmpty &&
        tileset != null;
  }

  Map<String, dynamic> toJson(Player player) {
    if (!isValid) {
      throw Exception("Invalid CreateRoomModel: $this");
    }
    return {
      "maxPlayers": maxPlayers,
      "isVersus": isVersus,
      "host": player.toJson(),
      "tileset": tileset!.toJson(),
    };
  }
}
