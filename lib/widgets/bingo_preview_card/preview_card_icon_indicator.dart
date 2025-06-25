import 'package:flutter/material.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Spacings.small,
      mainAxisSize: MainAxisSize.min,

      children: [
        Icon(icon, color: iconColor, size: 32),
        Text(count.toString(), style: TextStyles.normal()),
      ],
    );
  }
}
