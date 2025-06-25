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
    return Center(
      child: Card(
        shape: Decorations.bingoFieldBorder,
        child: Padding(
          padding: EdgeInsets.all(Spacings.extraLarge),

          child: GridView.count(
            crossAxisCount: size,
            shrinkWrap: true,
            mainAxisSpacing: Spacings.extraLarge,
            crossAxisSpacing: Spacings.extraLarge,
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
    );
  }
}
