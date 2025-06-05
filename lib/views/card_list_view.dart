import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/pagination.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _pageSize = 10;

  // Dummy data for demonstration
  final List<Map<String, String>> _allCards = List.generate(
    53,
    (i) => {
      'name': 'Card #${i + 1}',
      'date': '2025-06-${(i % 30) + 1}',
      'lastEdited': '2025-06-${(i % 30) + 1} 12:00',
    },
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleChangePage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  List<Map<String, String>> get _filteredCards {
    return _allCards;
  }

  List<Map<String, String>> get _paginatedCards {
    final filtered = _filteredCards;
    final start = (_currentPage - 1) * _pageSize;
    final end = (start + _pageSize).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  int get _totalPages =>
      (_filteredCards.length / _pageSize).ceil().clamp(1, 999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "View Cards"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar (row 1)
            const SizedBox(height: 16),
            // Paginated list
            Expanded(
              child:
                  _paginatedCards.isEmpty
                      ? const Center(child: Text('No cards found.'))
                      : ListView.separated(
                        itemCount: _paginatedCards.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final card = _paginatedCards[index];
                          return ListTile(
                            title: Text(card['name']!),
                            subtitle: Text(
                              'Created: ${card['date']}\nLast Edited: ${card['lastEdited']}',
                            ),
                            isThreeLine: true,
                          );
                        },
                      ),
            ),
            PaginationWidget(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: _handleChangePage,
            ),
          ],
        ),
      ),
    );
  }
}
