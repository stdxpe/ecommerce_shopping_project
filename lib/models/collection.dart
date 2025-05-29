import 'package:ecommerce_shopping_project/models/product.dart';

class Collection {
  final String id;
  final String title;
  final String subtitle;
  final String? detailedDescription;
  final String photo;
  final List<Product> products;

  Collection({
    required this.id,
    required this.title,
    required this.subtitle,
    this.detailedDescription,
    required this.photo,
    required this.products,
  });

  Collection copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? detailedDescription,
    String? photo,
    List<Product>? products,
  }) =>
      Collection(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        detailedDescription: detailedDescription ?? this.detailedDescription,
        photo: photo ?? this.photo,
        products: products ?? this.products,
      );

  @override
  String toString() {
    return 'Collection(id: $id, title: $title, subtitle: $subtitle, detailedDescription: $detailedDescription, photo: $photo, products: $products)';
  }
}
