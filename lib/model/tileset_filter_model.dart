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
  static Map<String, String> optionToRequest(SortOptions sortOption) {
    switch (sortOption) {
      case SortOptions.nameAsc:
        return {'field': 'name', 'order': 'asc'};
      case SortOptions.nameDesc:
        return {'field': 'name', 'order': 'desc'};
      case SortOptions.sizeAsc:
        return {'field': 'size', 'order': 'asc'};
      case SortOptions.sizeDesc:
        return {'field': 'size', 'order': 'desc'};
      case SortOptions.ratingAsc:
        return {'field': 'rating', 'order': 'asc'};
      case SortOptions.ratingDesc:
        return {'field': 'rating', 'order': 'desc'};
      case SortOptions.createdAtAsc:
        return {'field': 'createdAt', 'order': 'asc'};
      case SortOptions.createdAtDesc:
        return {'field': 'createdAt', 'order': 'desc'};
      case SortOptions.playsAsc:
        return {'field': 'plays', 'order': 'asc'};
      case SortOptions.playsDesc:
        return {'field': 'plays', 'order': 'desc'};
    }
  }

  static int getSelectedSortOptionIndex(SortOptions sortOption) {
    switch (sortOption) {
      case SortOptions.nameAsc:
      case SortOptions.nameDesc:
        return 0;
      case SortOptions.sizeAsc:
      case SortOptions.sizeDesc:
        return 1;
      case SortOptions.ratingAsc:
      case SortOptions.ratingDesc:
        return 2;
      case SortOptions.createdAtAsc:
      case SortOptions.createdAtDesc:
        return 3;
      case SortOptions.playsAsc:
      case SortOptions.playsDesc:
        return 4;
    }
  }

  static bool getIsSortOptionAscending(SortOptions sortOption) {
    switch (sortOption) {
      case SortOptions.nameAsc:
      case SortOptions.sizeAsc:
      case SortOptions.ratingAsc:
      case SortOptions.createdAtAsc:
      case SortOptions.playsAsc:
        return true;
      case SortOptions.nameDesc:
      case SortOptions.sizeDesc:
      case SortOptions.ratingDesc:
      case SortOptions.createdAtDesc:
      case SortOptions.playsDesc:
        return false;
    }
  }

  static SortOptions getSortOption(int fieldIndex, bool isAscending) {
    if (fieldIndex < 0 || fieldIndex >= sortOptionFields.length) {
      throw ArgumentError('Invalid field index: $fieldIndex');
    }
    final field = sortOptionFields[fieldIndex];
    return (isAscending ? field['optionAsc'] : field['optionDesc'])
        as SortOptions;
  }
}

const sortOptionFields = [
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

  Map<String, dynamic> toJson() {
    return {
      "names": search?.isNotEmpty == true ? [search] : null,
      "tags": tags,
      "sizes": size,
      "rating": rating,
      "plays": plays,
      "sort": CardListSort.optionToRequest(sort),
    };
  }
}
