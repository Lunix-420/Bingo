import 'package:flutter/material.dart';

enum SortOptions {
  nameAsc,
  nameDesc,
  sizeAsc,
  sizeDesc,
  ratingAsc,
  ratingDesc,
  createdAtAsc,
  createdAtDesc,
  playsAsc,
  playsDesc,
}

class CardListSort {
  static String optionToString(SortOptions sortOption) {
    switch (sortOption) {
      case SortOptions.nameAsc:
        return 'Name Ascending';
      case SortOptions.nameDesc:
        return 'Name Descending';
      case SortOptions.sizeAsc:
        return 'Size Ascending';
      case SortOptions.sizeDesc:
        return 'Size Descending';
      case SortOptions.ratingAsc:
        return 'Rating Ascending';
      case SortOptions.ratingDesc:
        return 'Rating Descending';
      case SortOptions.createdAtAsc:
        return 'Created At Ascending';
      case SortOptions.createdAtDesc:
        return 'Created At Descending';
      case SortOptions.playsAsc:
        return 'Plays Ascending';
      case SortOptions.playsDesc:
        return 'Plays Descending';
    }
  }
}

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
