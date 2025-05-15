import 'package:flutter/material.dart';

class ViewField extends StatelessWidget {
  final String tile;

  const ViewField({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(alignment: Alignment.center, child: Text(tile)),
    );
  }
}
