// ignore_for_file: public_member_api_docs, sort_constructors_first
class Filter {
  final double priceMin;
  final double priceMax;
  final String sortBy;
  final List<String> sizes;
  final List<String> brands;

  Filter({
    required this.priceMin,
    required this.priceMax,
    required this.sortBy,
    required this.sizes,
    required this.brands,
  });

  @override
  String toString() {
    return 'Filter(priceMin: $priceMin, priceMax: $priceMax, sortBy: $sortBy, sizes: $sizes, brands: $brands)';
  }
}
