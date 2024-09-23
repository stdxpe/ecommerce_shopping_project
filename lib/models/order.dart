import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';

class Order {
  final String id;
  final List<OrderProduct> products;
  final double totalPrice;
  final Timestamp createdAt;
  final Address shippingAddress;
  final int totalItemCount;
  final String status;
  final Timestamp statusReceivedDate;
  final Timestamp? statusPreparedDate;
  final Timestamp? statusOnTheWayDate;
  final Timestamp? statusDeliveredDate;

  Order({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.createdAt,
    required this.shippingAddress,
    required this.totalItemCount,
    required this.status,
    required this.statusReceivedDate,
    this.statusPreparedDate,
    this.statusOnTheWayDate,
    this.statusDeliveredDate,
  });

  Order copyWith({
    String? id,
    List<OrderProduct>? products,
    double? totalPrice,
    Timestamp? createdAt,
    Address? shippingAddress,
    int? totalItemCount,
    String? status,
    Timestamp? statusReceivedDate,
    Timestamp? statusPreparedDate,
    Timestamp? statusOnTheWayDate,
    Timestamp? statusDeliveredDate,
  }) =>
      Order(
        id: id ?? this.id,
        products: products ?? this.products,
        totalPrice: totalPrice ?? this.totalPrice,
        createdAt: createdAt ?? this.createdAt,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        totalItemCount: totalItemCount ?? this.totalItemCount,
        status: status ?? this.status,
        statusReceivedDate: statusReceivedDate ?? this.statusReceivedDate,
        statusPreparedDate: statusPreparedDate ?? this.statusPreparedDate,
        statusOnTheWayDate: statusOnTheWayDate ?? this.statusOnTheWayDate,
        statusDeliveredDate: statusDeliveredDate ?? this.statusDeliveredDate,
      );

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        products: List<OrderProduct>.from(
            json["products"].map((x) => OrderProduct.fromMap(x))),
        totalPrice: json["totalPrice"]?.toDouble(),
        createdAt: json["createdAt"],
        shippingAddress: Address.fromMap(json["shippingAddress"]),
        totalItemCount: json["totalItemCount"],
        status: json["status"],
        statusReceivedDate: json["statusReceivedDate"],
        statusPreparedDate: json["statusPreparedDate"],
        statusOnTheWayDate: json["statusOnTheWayDate"],
        statusDeliveredDate: json["statusDeliveredDate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "totalPrice": totalPrice,
        "createdAt": createdAt,
        "shippingAddress": shippingAddress.toMap(),
        "totalItemCount": totalItemCount,
        "status": status,
        "statusReceivedDate": statusReceivedDate,
        "statusPreparedDate": statusPreparedDate,
        "statusOnTheWayDate": statusOnTheWayDate,
        "statusDeliveredDate": statusDeliveredDate,
      };

  @override
  String toString() {
    return 'Order(id: $id, products: $products, totalPrice: $totalPrice, createdAt: $createdAt, shippingAddress: $shippingAddress, totalItemCount: $totalItemCount, status: $status, statusReceivedDate: $statusReceivedDate, statusPreparedDate: $statusPreparedDate, statusOnTheWayDate: $statusOnTheWayDate, statusDeliveredDate: $statusDeliveredDate)';
  }
}
