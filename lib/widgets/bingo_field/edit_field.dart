import 'package:flutter/material.dart';
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
  void _handleEdit() async {
    final controller = TextEditingController(text: widget.tile);
    final result = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('EDIT FIELD'),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Tile'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(controller.text),
                child: const Text('Save'),
              ),
            ],
          ),
    );
    if (result != null && result != widget.tile) {
      widget.onTileChanged(result, widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseTileWidget(tile: widget.tile, onLongPress: _handleEdit);
  }
}
