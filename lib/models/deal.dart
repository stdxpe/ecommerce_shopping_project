import 'dart:convert';

class Deal {
  final String id;
  final String photo;
  final String? productId;

  Deal({
    required this.id,
    required this.photo,
    this.productId,
  });

  Deal copyWith({
    String? id,
    String? photo,
    String? productId,
  }) =>
      Deal(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        productId: productId ?? this.productId,
      );

  factory Deal.fromJson(String str) => Deal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Deal.fromMap(Map<String, dynamic> json) => Deal(
        id: json["id"],
        photo: json["photo"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "photo": photo,
        "productId": productId,
      };

  @override
  String toString() {
    return 'Deal: \nid: $id, \nphoto: $photo, \nproductId: $productId';
  }
}
