import 'package:flutter/material.dart';

class BingoPreviewCardWidget extends StatelessWidget {
  const BingoPreviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(32),
        child: Text(
          "Bingo Preview Card",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
