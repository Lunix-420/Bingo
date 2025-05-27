import 'package:flutter/material.dart';

class PreviewCardTagChipWidget extends StatelessWidget {
  final String text;

  const PreviewCardTagChipWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
