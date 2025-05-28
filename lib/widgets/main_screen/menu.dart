import 'package:flutter/material.dart';
import 'package:frontend/widgets/main_screen/menu_button.dart';

class ButtonsBox extends StatelessWidget {
  final Animation<double> animation;
  final void Function(int index) onPressed;

  const ButtonsBox({
    super.key,
    required this.animation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 300.0),
        child: ScaleTransition(
          scale: animation,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var index = 0; index < 4; index++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MenuButton(
                      index: index,
                      onPressed: () => onPressed(index),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}