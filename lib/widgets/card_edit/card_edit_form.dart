import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/edit_field.dart';
import 'package:frontend/widgets/card_edit/name_input.dart';
import 'package:frontend/widgets/card_edit/size_input.dart';
import 'package:frontend/widgets/card_edit/tag_input.dart';

final logger = namedLogger("Card-Edit-Form-Widget");

class CardEditFormWidget extends StatefulWidget {
  final Tileset tileset;
  final Function(Tileset) onSave;

  const CardEditFormWidget({
    super.key,
    required this.tileset,
    required this.onSave,
  });

  @override
  State<CardEditFormWidget> createState() => _CardEditFormWidgetState();
}

class _CardEditFormWidgetState extends State<CardEditFormWidget> {
  late final Tileset _tileset;

  @override
  void initState() {
    super.initState();
    _tileset = widget.tileset;
  }

  void _handleTagsChange(List<String> newTags) {
    setState(() {
      _tileset.tags = newTags;
    });
  }

  void _handleNameChange(String? newName) {
    if (newName == null || newName.isEmpty) {
      return;
    }
    setState(() {
      _tileset.name = newName;
    });
  }

  void _handleSizeChange(int? newSize) {
    if (newSize == null) {
      return;
    }
    setState(() {
      try {
        _tileset.changeSize(newSize);
      } catch (e) {
        // TODO: maybe add a snackbar or dialog to inform the user
        logger.e("Failed to change size: $e");
      }
    });
  }

  void _handleTileChange(String newTile, int index) {
    setState(() {
      _tileset.tiles[index] = newTile;
    });
  }

  void _handleSave() {
    widget.onSave(_tileset);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        spacing: 32,
        children: [
          // Text input
          NameInputWidget(
            name: _tileset.name,
            onNameChanged: _handleNameChange,
          ),
          // Multi-input with edit/chip mode
          TagInputWidget(tags: _tileset.tags, onTagsChanged: _handleTagsChange),
          // Single select
          SizeInputWidget(
            size: _tileset.size,
            onSizeChanged: _handleSizeChange,
          ),
          BingoFieldWidget(
            tiles: _tileset.tiles,
            size: _tileset.size,
            tileBuilder: EditFieldWidget.tileBuilder(_handleTileChange),
          ),
          SizedBox(height: 16),
          // Save button
          ElevatedButton(onPressed: _handleSave, child: const Text('Save')),
        ],
      ),
    );
  }
}
