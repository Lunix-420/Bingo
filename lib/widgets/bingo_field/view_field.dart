import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

class ViewFieldWidget extends StatelessWidget {
  final String tile;

  const ViewFieldWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return BaseFieldWidget(tile: tile);
  }
}
