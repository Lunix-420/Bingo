import 'package:flutter/material.dart';
import 'package:frontend/widgets/main_view/menu_button.dart';

class JoinRoomOverlay extends StatelessWidget {
  const JoinRoomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Material(
          color: Colors.white.withValues(alpha: 0.7),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'JOIN ROOM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'NAME',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'CODE',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: buildButton(
                    color: Colors.lightGreenAccent,
                    label: 'JOIN',
                    onPressed: () {  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
