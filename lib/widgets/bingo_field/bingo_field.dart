import 'dart:math';

import 'package:flutter/material.dart'; // Changed to material for styling
import 'package:frontend/model/tileset.model.dart';

class BingoField extends StatelessWidget {
  final Tileset data;
  final Widget Function(String) render;

  const BingoField({super.key, required this.data, required this.render});

  @override
  Widget build(BuildContext context) {
    final size = sqrt(data.tiles.length);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueGrey, width: 4),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: size.toInt(),
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: data.tiles.map((tile) => render(tile)).toList(),
        ),
      ),
    );
  }
}
