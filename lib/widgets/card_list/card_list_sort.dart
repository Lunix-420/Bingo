import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/spacings.dart';

class CardListSortWidget extends StatefulWidget {
  final SortOptions selected;
  final Function(SortOptions sortOption) onSortChanged;

  const CardListSortWidget({
    super.key,
    required this.selected,
    required this.onSortChanged,
  });

  @override
  State<CardListSortWidget> createState() => _CardListSortWidgetState();
}

class _CardListSortWidgetState extends State<CardListSortWidget> {
  // Only the field to sort by is in the dropdown, order is a separate toggle
  late int _selectedField = CardListSort.getSelectedSortOptionIndex(
    widget.selected,
  );
  late bool _isAscending = CardListSort.getIsSortOptionAscending(
    widget.selected,
  );

  void _onFieldChanged(int? index) {
    if (index != null) {
      setState(() {
        _selectedField = index;
      });
      widget.onSortChanged(
        CardListSort.getSortOption(_selectedField, _isAscending),
      );
    }
  }

  void _toggleOrder() {
    setState(() {
      _isAscending = !_isAscending;
    });
    widget.onSortChanged(
      CardListSort.getSortOption(_selectedField, _isAscending),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Spacings.medium,
      children: [
        Expanded(
          child: DropdownMenu(
            dropdownMenuEntries: List.generate(
              sortOptionFields.length,
              (i) => DropdownMenuEntry<int>(
                value: i,
                label: sortOptionFields[i]['label'] as String,
              ),
            ),
            initialSelection: _selectedField,
            onSelected: _onFieldChanged,
            expandedInsets: EdgeInsets.zero,
          ),
        ),
        IconButton(
          icon: Icon(_isAscending ? Icons.arrow_upward : Icons.arrow_downward),
          tooltip: _isAscending ? 'Ascending' : 'Descending',
          onPressed: _toggleOrder,
          style: ButtonStyles.filterIconButton,
        ),
      ],
    );
  }
}
