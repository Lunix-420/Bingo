import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/widgets/card_list/card_list_filter_dialog.dart';
import 'package:frontend/widgets/card_list/card_list_search.dart';
import 'package:frontend/widgets/card_list/card_list_sort.dart';

class CardListFilterWidget extends StatefulWidget {
  final TilesetFilterModel filter;
  final Function(TilesetFilterModel filter) onFilterChange;

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
  late final TilesetFilterModel _filter;

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
    final TilesetFilterModel? filters = await showDialog(
      context: context,
      builder: (context) => CardListFilterDialogWidget(initialFilters: _filter),
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
      spacing: Spacings.medium,
      children: [
        CardListSearchWidget(controller: _searchController),
        Row(
          spacing: Spacings.medium,
          children: [
            Expanded(
              child: CardListSortWidget(
                selected: _filter.sort,
                onSortChanged: _handleSortChange,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt),
              tooltip: 'Open Dialog',
              onPressed: _openDialog,
              style: ButtonStyles.filterIconButton,
            ),
          ],
        ),
      ],
    );
  }
}
