import 'dart:convert';

class Filter {
  final String id;
  final String? query;
  final double? priceMin;
  final double? priceMax;
  final String? sortBy;
  final List<String>? sizes;
  final List<String>? collections;

  Filter({
    required this.id,
    this.query,
    this.priceMin,
    this.priceMax,
    this.sortBy,
    this.sizes,
    this.collections,
  });

  Filter copyWith({
    String? id,
    String? query,
    double? priceMin,
    double? priceMax,
    String? sortBy,
    List<String>? sizes,
    List<String>? collections,
  }) =>
      Filter(
        id: id ?? this.id,
        query: query ?? this.query,
        priceMin: priceMin ?? this.priceMin,
        priceMax: priceMax ?? this.priceMax,
        sortBy: sortBy ?? this.sortBy,
        sizes: sizes ?? this.sizes,
        collections: collections ?? this.collections,
      );

  factory Filter.fromJson(String str) => Filter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
        id: json["id"],
        query: json["query"],
        priceMin: json["priceMin"]?.toDouble(),
        priceMax: json["priceMax"]?.toDouble(),
        sortBy: json["sortBy"],
        sizes: json["sizes"] == null
            ? []
            : List<String>.from(json["sizes"]!.map((x) => x)),
        collections: json["collections"] == null
            ? []
            : List<String>.from(json["collections"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "query": query,
        "priceMin": priceMin,
        "priceMax": priceMax,
        "sortBy": sortBy,
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
        "collections": collections == null
            ? []
            : List<dynamic>.from(collections!.map((x) => x)),
      };

  @override
  String toString() {
    return 'Filter(id: $id, query: $query, priceMin: $priceMin, priceMax: $priceMax, sortBy: $sortBy, sizes: $sizes, collections: $collections)';
  }
}
