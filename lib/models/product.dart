import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String? brand;
  final String summary;
  final String detailedDescription;
  final double price;
  final Timestamp createdAt;
  final int? discountPercent;
  final String mainPhoto;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final List<String> keywords;
  final int totalOrdersCount;
  final int totalLikesCount;
  final double totalRating;
  final String storeId;
  final String storeName;
  final int stockCount;
  final double shippingFee;
  final int estimatedShippingDurationInDays;
  final List<String> collections;
  final int totalReviewsCount;

  Product({
    required this.id,
    required this.title,
    this.brand,
    required this.summary,
    required this.detailedDescription,
    required this.price,
    required this.createdAt,
    this.discountPercent,
    required this.mainPhoto,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.keywords,
    required this.totalOrdersCount,
    required this.totalLikesCount,
    required this.totalRating,
    required this.storeId,
    required this.storeName,
    required this.stockCount,
    required this.shippingFee,
    required this.estimatedShippingDurationInDays,
    required this.collections,
    required this.totalReviewsCount,
  });

  Product copyWith({
    String? id,
    String? title,
    String? brand,
    String? summary,
    String? detailedDescription,
    double? price,
    Timestamp? createdAt,
    int? discountPercent,
    String? mainPhoto,
    List<String>? photos,
    List<String>? colors,
    List<String>? sizes,
    List<String>? keywords,
    int? totalOrdersCount,
    int? totalLikesCount,
    double? totalRating,
    String? storeId,
    String? storeName,
    int? stockCount,
    double? shippingFee,
    int? estimatedShippingDurationInDays,
    List<String>? collections,
    int? totalReviewsCount,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      summary: summary ?? this.summary,
      detailedDescription: detailedDescription ?? this.detailedDescription,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      discountPercent: discountPercent ?? this.discountPercent,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      photos: photos ?? this.photos,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      keywords: keywords ?? this.keywords,
      totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
      totalLikesCount: totalLikesCount ?? this.totalLikesCount,
      totalRating: totalRating ?? this.totalRating,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      stockCount: stockCount ?? this.stockCount,
      shippingFee: shippingFee ?? this.shippingFee,
      estimatedShippingDurationInDays: estimatedShippingDurationInDays ??
          this.estimatedShippingDurationInDays,
      collections: collections ?? this.collections,
      totalReviewsCount: totalReviewsCount ?? this.totalReviewsCount,
    );
  }

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        brand: json["brand"],
        summary: json["summary"],
        detailedDescription: json["detailedDescription"],
        price: json["price"]?.toDouble(),
        createdAt: json["createdAt"],
        discountPercent: json["discountPercent"]?.toInt(),
        mainPhoto: json["mainPhoto"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        colors: List<String>.from(json["colors"].map((x) => x)),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        totalOrdersCount: json["totalOrdersCount"],
        totalLikesCount: json["totalLikesCount"],
        totalRating: json["totalRating"]?.toDouble(),
        storeId: json["storeId"],
        storeName: json["storeName"],
        stockCount: json["stockCount"],
        shippingFee: json["shippingFee"]?.toDouble(),
        estimatedShippingDurationInDays:
            json["estimatedShippingDurationInDays"],
        collections: List<String>.from(json["collections"].map((x) => x)),
        totalReviewsCount: json["totalReviewsCount"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "brand": brand,
        "summary": summary,
        "detailedDescription": detailedDescription,
        "price": price,
        "createdAt": createdAt,
        "discountPercent": discountPercent,
        "mainPhoto": mainPhoto,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "totalOrdersCount": totalOrdersCount,
        "totalLikesCount": totalLikesCount,
        "totalRating": totalRating,
        "storeId": storeId,
        "storeName": storeName,
        "stockCount": stockCount,
        "shippingFee": shippingFee,
        "estimatedShippingDurationInDays": estimatedShippingDurationInDays,
        "collections": List<dynamic>.from(collections.map((x) => x)),
        "totalReviewsCount": totalReviewsCount,
      };

  @override
  String toString() {
    return 'Product(id: $id, title: $title, brand: $brand, summary: $summary, detailedDescription: $detailedDescription, price: $price, createdAt: $createdAt, discountPercent: $discountPercent, mainPhoto: $mainPhoto, photos: $photos, colors: $colors, sizes: $sizes, keywords: $keywords, totalOrdersCount: $totalOrdersCount, totalLikesCount: $totalLikesCount, totalRating: $totalRating, storeId: $storeId, storeName: $storeName, stockCount: $stockCount, shippingFee: $shippingFee, estimatedShippingDurationInDays: $estimatedShippingDurationInDays, collections: $collections, totalReviewsCount: $totalReviewsCount)';
  }
}
