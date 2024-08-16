import 'dart:convert';

class Store {
  final String id;
  final String name;
  final String photo;
  final double totalRating;
  final int followersCount;
  final List<String> products;

  Store({
    required this.id,
    required this.name,
    required this.photo,
    required this.totalRating,
    required this.followersCount,
    required this.products,
  });

  Store copyWith({
    String? id,
    String? name,
    String? photo,
    double? totalRating,
    int? followersCount,
    List<String>? products,
  }) =>
      Store(
        id: id ?? this.id,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        totalRating: totalRating ?? this.totalRating,
        followersCount: followersCount ?? this.followersCount,
        products: products ?? this.products,
      );

  factory Store.fromJson(String str) => Store.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        totalRating: json["totalRating"]?.toDouble(),
        followersCount: json["followersCount"],
        products: List<String>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "photo": photo,
        "totalRating": totalRating,
        "followersCount": followersCount,
        "products": List<dynamic>.from(products.map((x) => x)),
      };

  @override
  String toString() {
    return 'Store(id: $id, name: $name, photo: $photo, totalRating: $totalRating, followersCount: $followersCount, products: $products)';
  }
}
