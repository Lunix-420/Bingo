import 'package:flutter/material.dart';

class PreviewCardRowWidget extends StatelessWidget {
  final Widget expandedChild;
  final Widget? trailingChild;

  const PreviewCardRowWidget({
    super.key,
    required this.expandedChild,
    this.trailingChild,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: expandedChild,
          ),
        ),
        trailingChild ?? const SizedBox.shrink(),
      ],
    );
  }
}
