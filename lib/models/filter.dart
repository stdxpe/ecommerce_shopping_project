// ignore_for_file: public_member_api_docs, sort_constructors_first
class Filter {
  final String? query;
  final double? priceMin;
  final double? priceMax;
  final String? sortBy;
  final List<String>? sizes;
  final List<String>? brands;

  Filter({
    this.query,
    this.priceMin,
    this.priceMax,
    this.sortBy,
    this.sizes,
    this.brands,
  });

  @override
  String toString() {
    return 'Filter(query: $query, priceMin: $priceMin, priceMax: $priceMax, sortBy: $sortBy, sizes: $sizes, brands: $brands)';
  }
}
