import 'package:flutter/material.dart';
import '../../theme/spacings.dart';

class MenuButtonWidget extends StatelessWidget {
  final Color color;
  final Text label;
  final VoidCallback onPressed;

  const MenuButtonWidget({
    super.key,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: Spacings.allLarge,
          shape: RoundedRectangleBorder(
            borderRadius: Spacings.roundBorderMedium,
          ),
        ),

        child: label,
      ),
    );
  }
}
