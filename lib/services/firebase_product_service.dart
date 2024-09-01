import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';

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
    debugPrint('FirebaseProductService getProductsByFilter exec');

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
}
