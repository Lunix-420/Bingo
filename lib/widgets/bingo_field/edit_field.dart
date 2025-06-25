import 'package:flutter/material.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

class EditTileWidget extends StatefulWidget {
  final String tile;
  final int index;
  final Function(String, int) onTileChanged;

  const EditTileWidget({
    super.key,
    required this.tile,
    required this.index,
    required this.onTileChanged,
  });

  @override
  State<EditTileWidget> createState() => _EditTileWidgetState();

  void handleEdit(BuildContext context) async {
    final controller = TextEditingController(text: tile);
    final result = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Center(child: Text('EDIT FIELD')),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Tile'),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Routing.navigateBack(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed:
                    () => Routing.navigateBack(context, value: controller.text),
                child: const Text('Save'),
              ),
            ],
          ),
    );
    if (result != null && result != tile) {
      onTileChanged(result, index);
    }
  }

  static Widget Function(String, int, bool?) tileBuilder(
    Function(String, int) onTileChanged,
  ) {
    return (String tile, int index, _) {
      return EditTileWidget(
        tile: tile,
        index: index,
        onTileChanged: onTileChanged,
      );
    };
  }
}

class _EditTileWidgetState extends State<EditTileWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseTileWidget(
      tile: widget.tile,
      onLongPress: () => widget.handleEdit(context),
    );
  }
}
