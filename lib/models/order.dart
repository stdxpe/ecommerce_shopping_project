import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';

class Order {
  final String id;
  final List<OrderProduct> products;
  final double totalPrice;
  final Timestamp createdAt;

  Order({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    List<OrderProduct>? products,
    double? totalPrice,
    Timestamp? createdAt,
  }) =>
      Order(
        id: id ?? this.id,
        products: products ?? this.products,
        totalPrice: totalPrice ?? this.totalPrice,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        products: List<OrderProduct>.from(
            json["products"].map((x) => OrderProduct.fromMap(x))),
        totalPrice: json["totalPrice"]?.toDouble(),
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "totalPrice": totalPrice,
        "createdAt": createdAt,
      };

  @override
  String toString() {
    return 'Order(id: $id, products: $products, totalPrice: $totalPrice, createdAt: $createdAt)';
  }
}
