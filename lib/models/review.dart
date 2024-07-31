import 'package:ecommerce_shopping_project/models/product.dart';

class Review {
  final String senderName;
  final String senderPhoto;
  final Product product;
  final double productRating;
  final String createdAt;
  final String text;

  Review({
    required this.senderName,
    required this.senderPhoto,
    required this.product,
    required this.productRating,
    required this.createdAt,
    required this.text,
  });
}
