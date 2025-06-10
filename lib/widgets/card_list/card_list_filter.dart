import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_list/card_list_filter_dialog.dart';
import 'package:frontend/widgets/card_list/card_list_search.dart';
import 'package:frontend/widgets/card_list/card_list_sort.dart';

class CardListFilter {
  String? search;
  SortOptions sort = SortOptions.nameAsc;
  List<String> tags = [];
  List<int> size = [];
  int? rating;
  int? plays;

  CardListFilter({
    this.search,
    this.sort = SortOptions.nameAsc,
    this.tags = const [],
    this.size = const [],
    this.rating,
    this.plays,
  });
}

class CardListFilterWidget extends StatefulWidget {
  final CardListFilter filter;
  final Function(CardListFilter filter) onFilterChange;

  const CardListFilterWidget({
    super.key,
    required this.filter,
    required this.onFilterChange,
  });

  @override
  State<CardListFilterWidget> createState() => _CardListFilterWidgetState();
}

class _CardListFilterWidgetState extends State<CardListFilterWidget> {
  final TextEditingController _searchController = TextEditingController();
  late final CardListFilter _filter;

  void _handleFilterChange() {
    widget.onFilterChange(_filter);
  }

  @override
  void initState() {
    _filter = widget.filter;
    _searchController.addListener(() {
      _filter.search = _searchController.text;
      _handleFilterChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openDialog() async {
    final AdditionalFilters? filters = await showDialog(
      context: context,
      builder: (context) => CardListFilterDialogWidget(),
    );
    if (filters != null) {
      setState(() {
        _filter.tags = filters.tags;
        _filter.size = filters.size;
        _filter.rating = filters.rating;
        _filter.plays = filters.plays;
      });
      _handleFilterChange();
    }
  }

  void _handleSortChange(SortOptions value) {
    setState(() {
      _filter.sort = value;
    });
    _handleFilterChange();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardListSearchWidget(controller: _searchController),
        Row(
          children: [
            Expanded(
              child: CardListSortWidget(onSortChanged: _handleSortChange),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.filter_alt),
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
