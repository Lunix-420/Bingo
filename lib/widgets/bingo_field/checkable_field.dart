import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

class CheckableFieldWidget extends StatelessWidget {
  final String tile;
  final bool checked;
  final VoidCallback? onCheckChange;

  const CheckableFieldWidget({
    super.key,
    required this.tile,
    this.checked = false,
    this.onCheckChange,
  });

  @override
  Widget build(BuildContext context) {
    return BaseFieldWidget(
      tile: tile,
      onTap: onCheckChange,
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
}
