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

  List<DropdownMenuEntry<int>> _getSizeOptions() {
    return TilesetService.validSizes.map((size) {
      return DropdownMenuEntry<int>(value: size, label: "${size}x$size");
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: _getSizeOptions(),
      initialSelection: size,
      onSelected: onSizeChanged,
      expandedInsets: EdgeInsets.zero,
    );
  }
}
