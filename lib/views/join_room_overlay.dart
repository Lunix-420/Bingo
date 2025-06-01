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
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Material(
          color: const Color(0xFFF3D7FF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFAB00FD), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'JOIN ROOM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                InputField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                SizedBox(height: screenHeight * 0.016),
                InputField(
                  hintText: 'Code',
                  controller: codeController,
                ),
                SizedBox(height: screenHeight * 0.024),
                JoinButton(
                  roomName: nameController.text.trim(),
                  roomCode: codeController.text.trim(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
