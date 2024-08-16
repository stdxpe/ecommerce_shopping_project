import 'package:ecommerce_shopping_project/models/deprecated/product.dart';

class Store {
  final String id;
  final String name;
  final String photo;
  final double totalRatings;
  final int followersCount;

  /// TODO: List<Product> or List<String> ??
  final List<Product> products;

  Store(
      {required this.id,
      required this.name,
      required this.photo,
      required this.totalRatings,
      required this.products,
      required this.followersCount});
}
