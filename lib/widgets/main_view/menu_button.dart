import 'package:flutter/material.dart';
import '../../theme/decorations.dart';
import '../../theme/textstyles.dart';
import '../../theme/spacings.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Container(
          width: width,
          decoration: Decorations.menuButton.copyWith(color: color),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onPressed,
              child: Padding(
                padding: Spacings.verticalMedium,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(label, style: TextStyles.normal()),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
