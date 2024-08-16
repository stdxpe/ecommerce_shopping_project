import 'dart:convert';

class CartProductDto {
  final String id;
  final String selectedProductId;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  CartProductDto({
    required this.id,
    required this.selectedProductId,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });

  CartProductDto copyWith({
    String? id,
    String? selectedProductId,
    String? selectedColor,
    String? selectedSize,
    int? itemCount,
  }) =>
      CartProductDto(
        id: id ?? this.id,
        selectedProductId: selectedProductId ?? this.selectedProductId,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
        itemCount: itemCount ?? this.itemCount,
      );

  factory CartProductDto.fromJson(String str) =>
      CartProductDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartProductDto.fromMap(Map<String, dynamic> json) => CartProductDto(
        id: json["id"],
        selectedProductId: json["selectedProductId"],
        selectedColor: json["selectedColor"],
        selectedSize: json["selectedSize"],
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "selectedProductId": selectedProductId,
        "selectedColor": selectedColor,
        "selectedSize": selectedSize,
        "itemCount": itemCount,
      };
}

// class CartProductDto {
//   final String id;
//   final String selectedProductId;
//   final String selectedColor;
//   final String selectedSize;
//   final int itemCount;

//   CartProductDto({
//     required this.id,
//     required this.selectedProductId,
//     required this.selectedColor,
//     required this.selectedSize,
//     required this.itemCount,
//   });
// }
