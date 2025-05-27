import 'package:flutter/material.dart';

class PreviewCardIconIndicatorWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color iconColor;

  const PreviewCardIconIndicatorWidget({
    super.key,
    required this.icon,
    required this.count,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
