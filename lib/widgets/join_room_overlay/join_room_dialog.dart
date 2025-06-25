import 'package:flutter/material.dart';
import 'package:frontend/model/player_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/future_create_button.dart';
import 'package:toastification/toastification.dart';

class JoinRoomDialog extends StatefulWidget {
  const JoinRoomDialog({super.key});

  @override
  State<JoinRoomDialog> createState() => _JoinRoomDialogState();
}

class _JoinRoomDialogState extends State<JoinRoomDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  Future<(Room?, Player?)>? joinRoomFuture;

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  void _joinRoom() {
    if (nameController.text.isEmpty || codeController.text.isEmpty) {
      Toast.show(
        "Error",
        "Please fill in all fields.",
        ToastificationType.error,
      );
      return;
    }
    setState(() {
      joinRoomFuture = RoomService.joinRoom(
        nameController.text,
        codeController.text,
        doThrow: true,
      );
    });
  }

  void _navigateToRoom(BuildContext context, (Room?, Player?)? result) {
    if (result == null) {
      Toast.show(
        "Error",
        "Failed to join room. Please check the room code and try again.",
        ToastificationType.error,
      );
      setState(() {
        joinRoomFuture = null;
      });
      return;
    }
    Routing.navigateBack(context);
    Routing.navigateRoom(context, room: result.$1!, player: result.$2!);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: const Text('JOIN ROOM')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: codeController,
            decoration: const InputDecoration(labelText: 'Room Code'),
          ),
        ],
      ),
      actions: [
        Center(
          child: FutureCreateButtonWidget(
            future: joinRoomFuture,
            buttonText: "JOIN",
            loadedText: "Joined Room",
            buttonCallback: _joinRoom,
            onDone: _navigateToRoom,
          ),

          // ElevatedButton(
          //   onPressed: () => _joinRoom(context),
          //   style: ButtonStyle(
          //     backgroundColor: WidgetStateProperty.all(AppColors.success),
          //   ),
          //   child: Text('JOIN', style: TextStyles.button()),
          // ),
        ),
      ],
    );
  }
}
