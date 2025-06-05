import 'package:flutter/material.dart';
import 'package:frontend/services/tileset_service.dart';

class SizeInputWidget extends StatelessWidget {
  final int size;
  final Function(int?) onSizeChanged;

  /// SizeInputWidget displays a dropdown for selecting the size of a bingo card.
  const SizeInputWidget({
    super.key,
    required this.size,
    required this.onSizeChanged,
  });

  List<DropdownMenuItem<int>> _getSizeOptions() {
    return TilesetService.validSizes.map((size) {
      return DropdownMenuItem<int>(value: size, child: Text("${size}x$size"));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: size,
      decoration: const InputDecoration(
        labelText: 'Select Size',
        border: OutlineInputBorder(),
      ),
      items: _getSizeOptions(),
      onChanged: onSizeChanged,
    );
  }
}
