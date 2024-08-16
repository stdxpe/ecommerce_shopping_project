import 'package:ecommerce_shopping_project/models/deprecated/product.dart';

class CartProduct {
  final String id;
  final Product selectedProduct;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  CartProduct({
    required this.id,
    required this.selectedProduct,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });
}
