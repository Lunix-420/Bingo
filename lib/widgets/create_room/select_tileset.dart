import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';

class SelectTilesetWidget extends StatelessWidget {
  final VoidCallback onSelect;
  final Tileset? tileset;

  const SelectTilesetWidget({super.key, required this.onSelect, this.tileset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Spacings.large,
      children: [
        if (tileset != null) BingoPreviewCardWidget(tileset: tileset!),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            padding: EdgeInsets.symmetric(
              horizontal: Spacings.extraLarge,
              vertical: Spacings.large,
            ),
          ),
          onPressed: onSelect,
          child: Text(
            'Select Bingo Field',
            style: TextStyles.button(
              color: AppColors.getContrastingColor(AppColors.secondary),
            ),
          ),
        ),
      ],
    );
  }
}
