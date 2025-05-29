import 'dart:convert';

class Banner {
  final String id;
  final String photo;
  final String? collection;
  final String? productId;

  Banner({
    required this.id,
    required this.photo,
    this.collection,
    this.productId,
  });

  Banner copyWith({
    String? id,
    String? photo,
    String? collection,
    String? productId,
  }) =>
      Banner(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        collection: collection ?? this.collection,
        productId: productId ?? this.productId,
      );

  factory Banner.fromJson(String str) => Banner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Banner.fromMap(Map<String, dynamic> json) => Banner(
        id: json["id"],
        photo: json["photo"],
        collection: json["collection"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "photo": photo,
        "collection": collection,
        "productId": productId,
      };

  @override
  String toString() {
    return 'Banner: \nid: $id, \nphoto: $photo, \ncollection: $collection, \nproductId: $productId';
  }
}
