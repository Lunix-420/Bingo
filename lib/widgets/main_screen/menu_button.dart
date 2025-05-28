import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.index,
    required this.onPressed,
  });

  Color _buttonColor(int index) {
    const colors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.orangeAccent,
    ];
    return colors[index % colors.length];
  }

  String _buttonName(int index) {
    const names = [
      'CREATE ROOM',
      'JOIN ROOM',
      'CREATE CARD',
      'VIEW CARDS',
    ];
    return names[index % names.length];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Container(
        decoration: BoxDecoration(
          color: _buttonColor(index),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.6),
              offset: Offset(-2, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  _buttonName(index),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(1.2, 1.2),
                        blurRadius: 2.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}