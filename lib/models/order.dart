import 'package:ecommerce_shopping_project/models/product.dart';

class Order {
  final String orderId;
  final List<Product> products;
  final double totalPrice;
  final String createdAt;

  Order({
    required this.orderId,
    required this.products,
    required this.totalPrice,
    required this.createdAt,
  });
}
