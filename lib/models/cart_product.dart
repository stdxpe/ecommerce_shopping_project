import 'dart:convert';

import 'package:ecommerce_shopping_project/models/product.dart';

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

  CartProduct copyWith({
    String? id,
    String? selectedColor,
    String? selectedSize,
    int? itemCount,
    Product? selectedProduct,
  }) =>
      CartProduct(
        id: id ?? this.id,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
        itemCount: itemCount ?? this.itemCount,
        selectedProduct: selectedProduct ?? this.selectedProduct,
      );

  factory CartProduct.fromJson(String str) =>
      CartProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartProduct.fromMap(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        selectedColor: json["selectedColor"],
        selectedSize: json["selectedSize"],
        itemCount: json["itemCount"],
        selectedProduct: Product.fromMap(json["selectedProduct"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "selectedColor": selectedColor,
        "selectedSize": selectedSize,
        "itemCount": itemCount,
        "selectedProduct": selectedProduct.toMap(),
      };

  @override
  String toString() {
    return 'CartProduct(id: $id, selectedColor: $selectedColor, selectedSize: $selectedSize, itemCount: $itemCount, selectedProduct: $selectedProduct)';
  }
}
