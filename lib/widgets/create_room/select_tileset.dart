import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';

class SelectTilesetWidget extends StatelessWidget {
  final VoidCallback onSelect;
  final Tileset? tileset;

  const SelectTilesetWidget({super.key, required this.onSelect, this.tileset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        if (tileset != null) BingoPreviewCardWidget(tileset: tileset!),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onSelect,
          child: const Text(
            'Select Bingo Field',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
