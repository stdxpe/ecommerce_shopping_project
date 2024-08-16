import 'dart:convert';

class Collection {
  final String id;
  final String title;
  final String subtitle;
  final String? detailedDescription;
  final String photo;
  final List<String> products;

  Collection({
    required this.id,
    required this.title,
    required this.subtitle,
    this.detailedDescription,
    required this.photo,
    required this.products,
  });

  Collection copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? detailedDescription,
    String? photo,
    List<String>? products,
  }) =>
      Collection(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        detailedDescription: detailedDescription ?? this.detailedDescription,
        photo: photo ?? this.photo,
        products: products ?? this.products,
      );

  factory Collection.fromJson(String str) =>
      Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        detailedDescription: json["detailedDescription"],
        photo: json["photo"],
        products: List<String>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "detailedDescription": detailedDescription,
        "photo": photo,
        "products": List<dynamic>.from(products.map((x) => x)),
      };

  @override
  String toString() {
    return 'Collection(id: $id, title: $title, subtitle: $subtitle, detailedDescription: $detailedDescription, photo: $photo, products: $products)';
  }
}
