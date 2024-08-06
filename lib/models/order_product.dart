import 'package:ecommerce_shopping_project/models/product.dart';

class OrderProduct {
  final String id;
  final Product selectedProduct;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  OrderProduct({
    required this.id,
    required this.selectedProduct,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });
}
