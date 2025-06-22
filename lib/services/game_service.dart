import 'package:flutter/material.dart';
import 'package:frontend/services/api_routes.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

final logger = namedLogger("Socket-IO");

class GameService {
  static io.Socket socket = io.io(
    ApiRoutes.socketRoute().toString(),
    io.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );
  static final List<dynamic Function()> _listeners = [];

  static void connectSocket({
    VoidCallback? onConnect,
    VoidCallback? onDisconnect,
  }) {
    socket.connect();
    socket.onConnect((_) {
      logger.i('Socket connected');
      onConnect?.call();
    });
    socket.onDisconnect((_) {
      logger.i('Socket disconnected');
      onDisconnect?.call();
    });
  }

  static void disconnectSocket() {
    if (socket.connected) {
      socket.disconnect();
      logger.i('Socket disconnected');
    }
  }

  static void emitJoinRoom(String roomCode) {
    logger.i('Emitting joinRoom with code: $roomCode');
    socket.emit("joinRoom", roomCode);
  }

  static void emitLeaveRoom(String roomCode) {
    logger.i('Emitting leaveRoom with code: $roomCode');
    socket.emit("leaveRoom", roomCode);
  }

  static void emitUpdateGameState(String roomCode) async {
    logger.i('Emitting updateGameState for room: $roomCode');
    socket.emit("updateGameState", roomCode);
  }

  static void onRoomUpdate(Function(dynamic) callback) {
    logger.i('Setting up listeners for room updates');
    _listeners.add(socket.on("joinedRoom", callback));
    _listeners.add(socket.on("leftRoom", callback));
  }

  static void onGameUpdate(Function(dynamic) callback) {
    logger.i('Setting up listeners for game updates');
    _listeners.add(socket.on("gameStateUpdated", callback));
    _listeners.add(socket.on("joinedRoom", callback));
    _listeners.add(socket.on("leftRoom", callback));
  }

  static void removeListeners() {
    logger.i('Removing room update listeners');
    for (var listener in _listeners) {
      listener();
    }
    _listeners.clear();
  }
}
