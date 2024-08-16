import 'package:ecommerce_shopping_project/models/deprecated/product.dart';

class Collection {
  final String id;
  final String title;
  final String subtitle;
  final String? description;
  final String photo;

  /// TODO: List<Product> or List<String> ??
  final List<Product> products;

  Collection({
    required this.id,
    required this.title,
    required this.subtitle,
    this.description,
    required this.photo,
    required this.products,
  });
}
