import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

class CheckableFieldWidget extends StatelessWidget {
  final int index;
  final String tile;
  final bool checked;
  final Function(int)? onCheckChange;

  const CheckableFieldWidget({
    super.key,
    required this.index,
    required this.tile,
    this.checked = false,
    this.onCheckChange,
  });

  void handleLongPress() {
    onCheckChange?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseFieldWidget(
      tile: tile,
      onLongPress: handleLongPress,
      child: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Text(
                tile,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            if (checked)
              Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(Icons.close_rounded, color: Colors.red[700]),
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
    return (tile, index, checked) => CheckableFieldWidget(
      index: index,
      tile: tile,
      checked: checked ?? false,
      onCheckChange: onCheckChange,
    );
  }
}
