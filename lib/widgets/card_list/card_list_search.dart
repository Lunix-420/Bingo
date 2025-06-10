import 'package:flutter/material.dart';

class CardListSearchWidget extends StatefulWidget {
  final TextEditingController controller;

  const CardListSearchWidget({super.key, required this.controller});

  @override
  State<CardListSearchWidget> createState() => _CardListSearchWidgetState();
}

class _CardListSearchWidgetState extends State<CardListSearchWidget> {
  String _searchText = '';

  void _onChanged(String value) {
    setState(() {
      _searchText = value;
    });
    // You can add a callback here if you want to notify parent of search changes
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search...',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon:
            _searchText.isNotEmpty
                ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    widget.controller.clear();
                    _onChanged('');
                  },
                )
                : null,
      ),
    );
  }
}
