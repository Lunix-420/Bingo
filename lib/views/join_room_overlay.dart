import 'package:flutter/material.dart';
import 'package:frontend/widgets/join_room_overlay/input_field.dart';
import 'package:frontend/widgets/join_room_overlay/join_button.dart';

class JoinRoomOverlay extends StatefulWidget {
  const JoinRoomOverlay({super.key});

  @override
  State<JoinRoomOverlay> createState() => _JoinRoomOverlayState();
}

class _JoinRoomOverlayState extends State<JoinRoomOverlay> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Material(
          color: Colors.purple.shade100,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 20,
              children: [
                const Text(
                  'JOIN ROOM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                JoinRoomInputWidget(
                  hintText: 'Name',
                  controller: nameController,
                ),
                JoinRoomInputWidget(
                  hintText: 'Code',
                  controller: codeController,
                ),
                JoinButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
