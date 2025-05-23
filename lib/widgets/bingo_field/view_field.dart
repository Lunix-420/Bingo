import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

class ViewField extends StatelessWidget {
  final String tile;

  const ViewField({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return BaseField(tile: tile);
  }
}
