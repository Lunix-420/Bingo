import 'package:flutter/material.dart'; // Changed to material for styling

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
            tiles.length,
            (index) => tileBuilder(
              tiles[index],
              index,
              checkedTiles.isNotEmpty ? checkedTiles[index] : null,
            ),
          ),
        ),
      ),
    );
  }
}
