class ApiRoutes {
  static const String _baseRoute = "http://localhost:3000";
  static const String _tilesetsBase = "$_baseRoute/tilesets";

  // --------------------------  Socket Route --------------------------
  static Uri socketRoute() => Uri.parse(_baseRoute);

  // --------------------------  Tileset Routes --------------------------

  static Uri getAllTilesets() => Uri.parse(_tilesetsBase);
  static Uri getTilesetById(String id) => Uri.parse("$_tilesetsBase/$id");
  static Uri postCreateTileset() => Uri.parse(_tilesetsBase);
  static Uri putUpdateTileset(String id) => Uri.parse("$_tilesetsBase/$id");
  static Uri deleteTileset(String id) => Uri.parse("$_tilesetsBase/$id");
  static Uri postSearchAllTilesets() => Uri.parse("$_tilesetsBase/search");
  static Uri postUpvoteTileset(String id) =>
      Uri.parse("$_tilesetsBase/$id/upvote");
  static Uri postDownvoteTileset(String id) =>
      Uri.parse("$_tilesetsBase/$id/downvote");

  // --------------------------  Room Routes --------------------------
  static Uri postCreateRoom() => Uri.parse("$_baseRoute/rooms");
  static Uri getRoomById(String id) => Uri.parse("$_baseRoute/rooms/$id");
  static Uri postPlayerJoinRoom(String id) =>
      Uri.parse("$_baseRoute/rooms/$id/join");
  static Uri getRoomIdFromCode(String code) =>
      Uri.parse("$_baseRoute/rooms/id/$code");
  static Uri postRoomStart(String id) =>
      Uri.parse("$_baseRoute/rooms/$id/start");

  // --------------------------  Player Routes --------------------------
  static Uri postCreatePlayer() => Uri.parse("$_baseRoute/players");
}
