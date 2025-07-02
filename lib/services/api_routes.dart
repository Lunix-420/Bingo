class ApiRoutes {
  static const String _baseRoute = "http://89.116.25.141:3000";
  static const String _tilesetsBase = "$_baseRoute/tilesets";
  static const String _roomsBase = "$_baseRoute/rooms";
  static const String _playersBase = "$_baseRoute/players";
  static const String _bingofieldsBase = "$_baseRoute/bingofields";

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
  static Uri postCreateRoom() => Uri.parse(_roomsBase);
  static Uri getRoomById(String id) => Uri.parse("$_roomsBase/$id");
  static Uri postPlayerJoinRoom(String id) => Uri.parse("$_roomsBase/$id/join");
  static Uri postPlayerLeaveRoom(String id) =>
      Uri.parse("$_roomsBase/$id/leave");
  static Uri getRoomIdFromCode(String code) =>
      Uri.parse("$_roomsBase/id/$code");
  static Uri postRoomStart(String id) => Uri.parse("$_roomsBase/$id/start");

  // --------------------------  Player Routes --------------------------
  static Uri postCreatePlayer() => Uri.parse(_playersBase);

  // --------------------------  Bingofield Routes --------------------------
  static Uri postCheckField(String fieldId) =>
      Uri.parse("$_bingofieldsBase/$fieldId/mark");
}
