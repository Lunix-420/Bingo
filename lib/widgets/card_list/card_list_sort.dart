import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_filter_model.dart';

class CardListSortWidget extends StatefulWidget {
  final Function(SortOptions sortOption) onSortChanged;

  const CardListSortWidget({super.key, required this.onSortChanged});

  @override
  State<CardListSortWidget> createState() => _CardListSortWidgetState();
}

class _CardListSortWidgetState extends State<CardListSortWidget> {
  // Only the field to sort by is in the dropdown, order is a separate toggle
  static const _fields = [
    {
      'label': 'Name',
      'optionAsc': SortOptions.nameAsc,
      'optionDesc': SortOptions.nameDesc,
    },
    {
      'label': 'Size',
      'optionAsc': SortOptions.sizeAsc,
      'optionDesc': SortOptions.sizeDesc,
    },
    {
      'label': 'Rating',
      'optionAsc': SortOptions.ratingAsc,
      'optionDesc': SortOptions.ratingDesc,
    },
    {
      'label': 'Created At',
      'optionAsc': SortOptions.createdAtAsc,
      'optionDesc': SortOptions.createdAtDesc,
    },
    {
      'label': 'Plays',
      'optionAsc': SortOptions.playsAsc,
      'optionDesc': SortOptions.playsDesc,
    },
  ];

  int _selectedField = 0;
  bool _isAscending = true;

  void _onFieldChanged(int? index) {
    if (index != null) {
      setState(() {
        _selectedField = index;
      });
    }
  }

  void _toggleOrder() {
    setState(() {
      _isAscending = !_isAscending;
    });
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
              _fields.length,
              (i) => DropdownMenuItem<int>(
                value: i,
                child: Text(_fields[i]['label'] as String),
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
