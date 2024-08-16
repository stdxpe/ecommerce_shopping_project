import 'dart:convert';

class OrderProduct {
  final String id;
  final String selectedProductId;
  final String title;
  final String photo;
  final double price;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  OrderProduct({
    required this.id,
    required this.selectedProductId,
    required this.title,
    required this.photo,
    required this.price,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });

  OrderProduct copyWith({
    String? id,
    String? selectedProductId,
    String? title,
    String? photo,
    double? price,
    String? selectedColor,
    String? selectedSize,
    int? itemCount,
  }) =>
      OrderProduct(
        id: id ?? this.id,
        selectedProductId: selectedProductId ?? this.selectedProductId,
        title: title ?? this.title,
        photo: photo ?? this.photo,
        price: price ?? this.price,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
        itemCount: itemCount ?? this.itemCount,
      );

  factory OrderProduct.fromJson(String str) =>
      OrderProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderProduct.fromMap(Map<String, dynamic> json) => OrderProduct(
        id: json["id"],
        selectedProductId: json["selectedProductId"],
        title: json["title"],
        photo: json["photo"],
        price: json["price"]?.toDouble(),
        selectedColor: json["selectedColor"],
        selectedSize: json["selectedSize"],
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "selectedProductId": selectedProductId,
        "title": title,
        "photo": photo,
        "price": price,
        "selectedColor": selectedColor,
        "selectedSize": selectedSize,
        "itemCount": itemCount,
      };
}
