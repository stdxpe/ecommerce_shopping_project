import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FirebaseProductService extends IProductService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<Product?> getProductById({required String productId}) async {
    var returnedDocSnapshot = await _db.doc('products/$productId').get();
    var returnedMap = returnedDocSnapshot.data();

    if (returnedDocSnapshot.exists &&
        returnedMap != null &&
        returnedMap.isNotEmpty) {
      Product product = Product.fromMap(returnedMap);

      debugPrint(
          'FirebaseProductService getProductById if block exec. Product is NOT null');

      return product;
    } else {
      debugPrint(
          'FirebaseProductService getProductById else block exec. Product is null');
      return null;
    }
  }

  @override
  Future<void> createProduct({required Product product}) async {
    debugPrint('FirebaseProductService createProduct exec');
    _db.doc('products/${product.id}').set(product.toMap());
  }

  @override
  Future<void> updateProduct({required Product product}) async {
    debugPrint('FirebaseProductService updateProduct exec');
    _db.doc('products/${product.id}').update(product.toMap());
  }

  @override
  Future<void> deleteProduct({required String productId}) async {
    debugPrint('FirebaseProductService deleteProduct exec');
    _db.doc('products/$productId').delete();
  }

  @override
  Future<List<Product>> getProductsByFilter(
      {required filter, int maxResultCount = 10}) async {
    debugPrint('FirebaseProductService getProductsByFilter() exec');

    var collectionRef = _db
        .collection('products')
        .where('price', isGreaterThan: filter.priceMin)
        .where('price', isLessThan: filter.priceMax)
        .where("keywords", arrayContainsAny: [...filter.query!.split(' ')]);

    if (filter.sortBy == AppStrings.filterSortByPopular) {
      collectionRef =
          collectionRef.orderBy('totalLikesCount', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByRating) {
      collectionRef = collectionRef.orderBy('totalRating', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByNewest) {
      collectionRef = collectionRef.orderBy('createdAt', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByPriceHigh) {
      collectionRef = collectionRef.orderBy('price', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByPriceLow) {
      collectionRef = collectionRef.orderBy('price', descending: false);
    }

    var returnedCollectionSnapshot =
        await collectionRef.limit(maxResultCount).get();

    List<Product> tempList = [];

    var returnedList = returnedCollectionSnapshot.docs;

    if (returnedCollectionSnapshot.docs.isNotEmpty && returnedList.isNotEmpty) {
      debugPrint(
          'FirebaseProductService getProductsByFilter if block exec. List is NOT empty');

      for (var doc in returnedList) {
        var returnedMap = doc.data();
        tempList.add(Product.fromMap(returnedMap));
      }
    } else {
      debugPrint(
          'FirebaseProductService getProductsByFilter else block exec. List is empty');
    }
    return tempList;
  }

  @override
  Future<List<Review>> getProductReviews({required String productId}) async {
    var returnedCollectionSnapshot = await _db
        .collection('products/$productId/reviews')
        .orderBy('createdAt', descending: true)
        .get();
    var returnedList = returnedCollectionSnapshot.docs;

    List<Review> tempList = [];

    if (returnedCollectionSnapshot.docs.isNotEmpty && returnedList.isNotEmpty) {
      debugPrint(
          'FirebaseCollectionService getProductReviews if block exec. List is NOT empty');

      for (var doc in returnedList) {
        var returnedMap = doc.data();
        tempList.add(Review.fromMap(returnedMap));
      }
    }
    return tempList;
  }
}





///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

////// IF NEW PRODUCT CREATION NEEDED WITHOUT BACKEND
///
// // String id = const Uuid().v4();
// // String title = 'Cardigan slim fit with small studs';
// // String summary =
// //     'Cardigan slim fit with small studs. Round neck, central buttons for opening and long sleeves';
// // String detailedDescription =
// //     'COMPOSITION: VISCOSE 50% POLYESTER 28% NYLON 22%';
// // List<String> keywords = [
// //   'All',
// //   ...title.toLowerCase().split(' '),
// // ];
// // Product newlyCreatedproduct = Product(
// //   // id: const Uuid().v4(),
// //   id: id,
// //   title: title,
// //   summary: summary,
// //   detailedDescription: detailedDescription,
// //   brand: 'Fracomina',
// //   price: double.parse(
// //       faker.commerce.price(symbol: '', min: 50, max: 1000)),
// //   createdAt: createdAt,
// //   mainPhoto: 'products/$id/cover.jpg',
// //   photos: [
// //     'products/$id/1.jpg',
// //     'products/$id/2.jpg',
// //     'products/$id/3.jpg',
// //   ],
// //   colors: colors,
// //   sizes: ['XS', 'S', 'M', 'L', 'XL'],
// //   keywords: keywords,
// //   totalOrdersCount: faker.datatype.number(min: 10, max: 500),
// //   totalLikesCount: faker.datatype.number(min: 50, max: 1000),
// //   totalRating:
// //       faker.datatype.float(min: 0.5, max: 5, precision: 2),
// //   storeId: const Uuid().v1(),
// //   storeName: faker.company.companyName(),
// //   stockCount: faker.datatype.number(min: 0, max: 500),
// //   shippingFee: double.parse(
// //       faker.commerce.price(symbol: '', min: 0, max: 15)),
// //   estimatedShippingDurationInDays:
// //       faker.datatype.number(min: 0, max: 5),
// //   collections: [],
// //   reviews: [],
// // );
// // print('newlyCreatedproduct: $newlyCreatedproduct');

///////// await _productService.createProduct(product: newlyCreatedproduct);

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////