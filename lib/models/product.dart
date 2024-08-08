import 'package:ecommerce_shopping_project/models/category.dart';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/review.dart';

class Product {
  final String id;
  final String title;
  final String brand;
  final String summary;
  final String description;
  final double price;
  final bool? isOnSale;
  final double? salePrice;
  final String? saleLastDate;
  final String mainPhoto;
  final List<String> photos;
  final List<Category> categories;
  final List<Collection>? collections;
  final String createdAt;
  final List<String> colors;
  final List<String> sizes;
  final int totalOrdersCount;
  final int totalLikesCount;
  final double totalRating;
  final String storeId;
  final String storeName;
  final int stockCount;
  final bool isFreeShipping;
  final double? shippingFee;
  final int estimatedShippingDurationInDays;
  final List<Review> reviews;

  Product(
      {required this.id,
      required this.title,
      required this.brand,
      required this.summary,
      required this.description,
      required this.price,
      this.isOnSale,
      this.salePrice,
      this.saleLastDate,
      required this.mainPhoto,
      required this.photos,
      required this.categories,
      this.collections,
      required this.createdAt,
      required this.colors,
      required this.sizes,
      required this.totalOrdersCount,
      required this.totalLikesCount,
      required this.totalRating,
      required this.reviews,
      required this.storeId,
      required this.storeName,
      required this.stockCount,
      required this.isFreeShipping,
      required this.shippingFee,
      required this.estimatedShippingDurationInDays});
}
