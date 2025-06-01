import 'package:flutter/material.dart';

Widget buildCustomButton({
  required Color color,
  required String label,
  required bool isWideButton,
  required VoidCallback onPressed,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = isWideButton
          ? constraints.maxWidth
          : constraints.maxWidth * 0.5;

      return Container(
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black54,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Color(0x99FFFFFF),
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
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
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
    },
  );
}