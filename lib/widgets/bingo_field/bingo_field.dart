import 'package:flutter/material.dart';
import 'package:frontend/theme/decorations.dart';
import 'package:frontend/theme/spacings.dart'; // Changed to material for styling

class BingoFieldWidget extends StatelessWidget {
  final List<String> tiles;
  final int size; // enum of [3,4,5,6]
  final Widget Function(String, int, bool?) tileBuilder;
  final List<bool> checkedTiles;

  const BingoFieldWidget({
    super.key,
    required this.tiles,
    required this.size,
    required this.tileBuilder,
    this.checkedTiles = const [],
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Spacings.medium;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Card(
        shape: Decorations.bingoFieldBorder,
        child: Padding(
          padding: EdgeInsets.all(spacing),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight * 0.6,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                crossAxisCount: size,
                shrinkWrap: true,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                physics: const NeverScrollableScrollPhysics(),
                children: List<Widget>.generate(
                  tiles.length,
                  (index) => tileBuilder(
                    tiles[index],
                    index,
                    checkedTiles.isNotEmpty ? checkedTiles[index] : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
