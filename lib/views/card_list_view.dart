import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/card_list/card_list_filter.dart';
import 'package:frontend/widgets/future_loader.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  CardListFilter _filter = CardListFilter();
  Timer? _debounce;

  void _handleFilterChange(CardListFilter filter) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 750), () {
      setState(() {
        _filter = filter;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "View Cards"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar (row 1)
            CardListFilterWidget(
              filter: _filter,
              onFilterChange: _handleFilterChange,
            ),
            const SizedBox(height: 16),
            // Paginated list
            Expanded(
              child: FutureLoaderWidget(
                future: TilesetService.fetchTilesets(),
                builder: (context, tilesets) {
                  return ListView.builder(
                    itemCount: tilesets.length,
                    itemBuilder: (context, index) {
                      final tileset = tilesets[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: BingoPreviewCardWidget(
                          name: tileset.name,
                          size: tileset.size,
                          tags: tileset.tags,
                          likes: tileset.rating,
                          plays: tileset.plays,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
