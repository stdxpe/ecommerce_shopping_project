class Filter {
  final String? query;
  final double? priceMin;
  final double? priceMax;
  final String? sortBy;
  final List<String>? sizes;
  final List<String>? collections;

  Filter({
    this.query,
    this.priceMin,
    this.priceMax,
    this.sortBy,
    this.sizes,
    this.collections,
  });

  @override
  String toString() {
    return 'Filter(query: $query, priceMin: $priceMin, priceMax: $priceMax, sortBy: $sortBy, sizes: $sizes, collections: $collections)';
  }

  Filter copyWith({
    String? query,
    double? priceMin,
    double? priceMax,
    String? sortBy,
    List<String>? sizes,
    List<String>? collections,
  }) {
    return Filter(
      query: query ?? this.query,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      sortBy: sortBy ?? this.sortBy,
      sizes: sizes ?? this.sizes,
      collections: collections ?? this.collections,
    );
  }
}
