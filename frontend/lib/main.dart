import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket socket = IO.io(
  'http://localhost:3000',
  IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build(),
);

void main() {
  socket.connect();
  socket.onConnect((_) {
    //print('connect');
    socket.emit('msg', 'test');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello there'))),
    );
  }
}
