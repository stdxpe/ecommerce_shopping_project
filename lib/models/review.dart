import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String productId;
  final String senderName;
  final String senderPhoto;
  final double productRating;
  final Timestamp createdAt;
  final String text;

  Review({
    required this.id,
    required this.productId,
    required this.senderName,
    required this.senderPhoto,
    required this.productRating,
    required this.createdAt,
    required this.text,
  });

  Review copyWith({
    String? id,
    String? productId,
    String? senderName,
    String? senderPhoto,
    double? productRating,
    Timestamp? createdAt,
    String? text,
  }) =>
      Review(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        senderName: senderName ?? this.senderName,
        senderPhoto: senderPhoto ?? this.senderPhoto,
        productRating: productRating ?? this.productRating,
        createdAt: createdAt ?? this.createdAt,
        text: text ?? this.text,
      );

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        id: json["id"],
        productId: json["productId"],
        senderName: json["senderName"],
        senderPhoto: json["senderPhoto"],
        productRating: json["productRating"]?.toDouble(),
        createdAt: json["createdAt"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productId": productId,
        "senderName": senderName,
        "senderPhoto": senderPhoto,
        "productRating": productRating,
        "createdAt": createdAt,
        "text": text,
      };

  @override
  String toString() {
    return 'Review(id: $id, productId: $productId, senderName: $senderName, senderPhoto: $senderPhoto, productRating: $productRating, createdAt: $createdAt, text: $text)';
  }
}
