import 'package:flutter/widgets.dart';

class Tileset {
  String name = "";
  int size = 0;
  List<String> tiles = [];
  List<String> tags = [];
}

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
