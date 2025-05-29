import 'dart:convert';

class CollectionDto {
  final String id;
  final String title;
  final String subtitle;
  final String? detailedDescription;
  final String photo;
  final List<String> products;

  CollectionDto({
    required this.id,
    required this.title,
    required this.subtitle,
    this.detailedDescription,
    required this.photo,
    required this.products,
  });

  CollectionDto copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? detailedDescription,
    String? photo,
    List<String>? products,
  }) =>
      CollectionDto(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        detailedDescription: detailedDescription ?? this.detailedDescription,
        photo: photo ?? this.photo,
        products: products ?? this.products,
      );

  factory CollectionDto.fromJson(String str) =>
      CollectionDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectionDto.fromMap(Map<String, dynamic> json) => CollectionDto(
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
    return 'CollectionDto(id: $id, title: $title, subtitle: $subtitle, detailedDescription: $detailedDescription, photo: $photo, products: $products)';
  }
}
