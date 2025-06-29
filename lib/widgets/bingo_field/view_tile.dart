import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_field/base_tile.dart';

class ViewTileWidget extends StatelessWidget {
  final String tile;

  const ViewTileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return BaseTileWidget(tile: tile);
  }

  static Widget tileBuilder(String tile, int index, bool? _) {
    return ViewTileWidget(tile: tile);
  }
}
