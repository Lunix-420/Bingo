import 'dart:math';

import 'package:flutter/material.dart'; // Changed to material for styling
import 'package:frontend/model/tileset.model.dart';

class BingoField extends StatelessWidget {
  final Tileset data;
  final Widget Function(String, int) render;

  const BingoField({super.key, required this.data, required this.render});

  @override
  Widget build(BuildContext context) {
    // We assume that the tileset is a square grid and if not
    // we will just use the biggest field possible
    final size = sqrt(data.tiles.length).floor();

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
        child: GridView.count(
          crossAxisCount: size,
          shrinkWrap: true,
          mainAxisSpacing: 32,
          crossAxisSpacing: 32,
          physics: const NeverScrollableScrollPhysics(),
          children: List<Widget>.generate(
            data.tiles.length,
            (index) => render(data.tiles[index], index),
          ),
        ),
      ),
    );
  }
}
