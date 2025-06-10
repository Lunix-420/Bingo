import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_filter_model.dart';

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
      children: [
        Expanded(
          child: DropdownButton<int>(
            value: _selectedField,
            onChanged: _onFieldChanged,
            items: List.generate(
              sortOptionFields.length,
              (i) => DropdownMenuItem<int>(
                value: i,
                child: Text(sortOptionFields[i]['label'] as String),
              ),
            ),
            isExpanded: true,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(_isAscending ? Icons.arrow_upward : Icons.arrow_downward),
          tooltip: _isAscending ? 'Ascending' : 'Descending',
          onPressed: _toggleOrder,
        ),
      ],
    );
  }
}
