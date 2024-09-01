import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

import 'package:ecommerce_shopping_project/models/collection_dto.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';

class FirebaseCollectionService extends ICollectionService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<List<CollectionDto>> getAllCollections() async {
    var returnedCollectionSnapshot = await _db.collection('collections').get();
    var returnedList = returnedCollectionSnapshot.docs;

    List<CollectionDto> tempList = [];

    if (returnedCollectionSnapshot.docs.isNotEmpty && returnedList.isNotEmpty) {
      debugPrint(
          'FirebaseCollectionService getAllCollections if block exec. List is NOT empty');

      for (var doc in returnedList) {
        var returnedMap = doc.data();
        tempList.add(CollectionDto.fromMap(returnedMap));
      }
    }
    return tempList;
  }

  @override
  Future<CollectionDto?> getCollectionById(
      {required String collectionId}) async {
    var returnedDocSnapshot = await _db.doc('collections/$collectionId').get();
    var returnedMap = returnedDocSnapshot.data();

    if (returnedDocSnapshot.exists &&
        returnedMap != null &&
        returnedMap.isNotEmpty) {
      debugPrint(
          'FirebaseCollectionService getCollectionById if block exec. Collection is NOT null');

      return CollectionDto.fromMap(returnedMap);
    } else {
      debugPrint(
          'FirebaseCollectionService getCollectionById else block exec. Collection is null');
      return null;
    }
  }

  @override
  Future<void> createCollection({required CollectionDto collectionDto}) async {
    debugPrint('FirebaseCollectionService createCollection exec');
    _db.doc('collections/${collectionDto.id}').set(collectionDto.toMap());
  }
}
