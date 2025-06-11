import 'package:frontend/services/api_routes.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

final logger = namedLogger("Socket-IO");

class GameService {
  static io.Socket socket = io.io(
    ApiRoutes.socketRoute(),
    io.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );

  static void connectSocket() {
    if (!socket.connected) {
      socket.connect();
      socket.onConnect((_) {
        logger.i('Socket connected');
      });
      socket.onDisconnect((_) {
        logger.i('Socket disconnected');
      });
    }
  }

  static void disconnectSocket() {
    if (socket.connected) {
      socket.disconnect();
      logger.i('Socket disconnected');
    }
  }

  static void emit(String event, [dynamic data]) {
    if (socket.connected) {
      socket.emit(event, data);
      logger.i('Emitted event: $event with data: $data');
    } else {
      logger.w('Socket not connected. Cannot emit event: $event');
    }
  }

  static void on(String event, dynamic Function(dynamic) callback) {
    socket.on(event, callback);
    logger.i('Listening for event: $event');
  }
}
