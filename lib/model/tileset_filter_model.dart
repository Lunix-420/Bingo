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

class TilesetFilterModel {
  String? search;
  SortOptions sort = SortOptions.nameAsc;
  List<String> tags = [];
  List<int> size = [];
  int? rating;
  int? plays;

  TilesetFilterModel({
    this.search,
    this.sort = SortOptions.nameAsc,
    this.tags = const [],
    this.size = const [],
    this.rating,
    this.plays,
  });
}
