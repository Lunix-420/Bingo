import 'package:flutter/material.dart';
import 'package:frontend/theme/utils.dart';

class ViewField extends StatelessWidget {
  final String tile;

  const ViewField({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeUtils(context);

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.getPrimary(),
        border: Border.all(color: Colors.blueGrey, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        tile,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
