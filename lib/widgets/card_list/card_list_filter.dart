import 'package:flutter/material.dart';

class CardListFilterWidget extends StatefulWidget {
  final Function(Map<String, String>) onFilterChange;

  const CardListFilterWidget({super.key, required this.onFilterChange});

  @override
  State<CardListFilterWidget> createState() => _CardListFilterWidgetState();
}

class _CardListFilterWidgetState extends State<CardListFilterWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _sortOptions = ['Name', 'Date Created', 'Last Edited'];
  final Map<String, String> _filters = {'search': '', 'sort': ''};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Dialog'),
            content: const Text('This is a dialog!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(controller: _searchController),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: "",
                items:
                    _sortOptions
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {});
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Sort by',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              tooltip: 'Open Dialog',
              onPressed: _openDialog,
              color: Theme.of(context).colorScheme.primary,
              iconSize: 32,
            ),
          ],
        ),
      ],
    );
  }
}
