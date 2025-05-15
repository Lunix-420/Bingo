import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset.model.dart';

class BingoField extends StatelessWidget {
  final Tileset data;
  final Widget Function(String) render;

  const BingoField({super.key, required this.data, required this.render});

  @override
  Widget build(BuildContext context) {
    final size = data.tiles.length;

    return GridView.count(
      crossAxisCount: size,
      shrinkWrap: true,
      children:
          data.tiles.map((tile) {
            return render(tile);
          }).toList(),
    );
  }
}
