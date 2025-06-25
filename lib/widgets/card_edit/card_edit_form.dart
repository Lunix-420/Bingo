import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/utils/focus_utils.dart';
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
  final TextEditingController _nameController = TextEditingController();
  bool _isTileSelected = false;

  @override
  void initState() {
    super.initState();
    _tileset = widget.tileset;
    _nameController.text = _tileset.name;
    FocusManager.instance.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _nameController.dispose();
    FocusManager.instance.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isTileSelected = getFocusedElement<EditTileWidget>() != null;
    });
  }

  void _handleTagsChange(List<String> newTags) {
    setState(() {
      _tileset.tags = newTags;
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

  void _handleEditClick() {
    final selectedTile = getFocusedElement<EditTileWidget>();
    if (selectedTile != null) {
      selectedTile.handleEdit(context);
    } else {
      logger.w("No tile selected for editing.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.large),
      child: Column(
        spacing: Spacings.extraLarge,
        children: [
          NameInputWidget(controller: _nameController),
          TagInputWidget(tags: _tileset.tags, onTagsChanged: _handleTagsChange),
          SizeInputWidget(
            size: _tileset.size,
            onSizeChanged: _handleSizeChange,
          ),
          BingoFieldWidget(
            tiles: _tileset.tiles,
            size: _tileset.size,
            tileBuilder: EditTileWidget.tileBuilder(_handleTileChange),
          ),
          ElevatedButton(
            onPressed: _isTileSelected ? _handleEditClick : null,
            child:
                _isTileSelected ? const Text("Edit") : const Text("Select..."),
          ),
          ElevatedButton(onPressed: _handleSave, child: const Text('Save')),
        ],
      ),
    );
  }
}
