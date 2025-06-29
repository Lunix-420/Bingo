import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/widgets/bingo_field/base_tile.dart';

class CheckableTileWidget extends StatelessWidget {
  final int index;
  final String tile;
  final bool checked;
  final Function(int)? onCheckChange;

  const CheckableTileWidget({
    super.key,
    required this.index,
    required this.tile,
    this.checked = false,
    this.onCheckChange,
  });

  void _handleLongPress() {
    onCheckChange?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseTileWidget(
      tile: tile,
      onLongPress: _handleLongPress,
      child: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(child: BaseTileWidget.baseFieldText(tile)),
            if (checked)
              Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(Icons.close_rounded, color: AppColors.error),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget Function(String, int, bool?) tileBuilder(
    Function(int) onCheckChange,
  ) {
    return (tile, index, checked) => CheckableTileWidget(
      index: index,
      tile: tile,
      checked: checked ?? false,
      onCheckChange: onCheckChange,
    );
  }
}
