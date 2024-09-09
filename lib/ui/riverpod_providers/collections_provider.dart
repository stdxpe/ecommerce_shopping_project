import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

enum Collections { autumn, spring, winter, summer }

final selectedCollection = Provider.family<int, Collections>((ref, collection) {
  return switch (collection) {
    Collections.autumn => 0,
    Collections.spring => 1,
    Collections.summer => 2,
    Collections.winter => 3,
  };
});

final collectionsProvider =
    AsyncNotifierProvider<CollectionNotifier, List<Collection>>(
        () => CollectionNotifier());

class CollectionNotifier extends AsyncNotifier<List<Collection>> {
  @override
  FutureOr<List<Collection>> build() async {
    /// Initial State Setup Operation
    getAllCollections();

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _collectionManager = locator<ICollectionRepository>();

  getAllCollections() async {
    debugPrint('CollectionNotifier | getAllCollections() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await _collectionManager.getAllCollections(),
    );
    debugPrint('state: $state');
  }

  getCollectionById(String collectionId) async {
    debugPrint('CollectionNotifier | getCollectionById() Executed');

    var collection = await AsyncValue.guard(
      () async => await _collectionManager.getCollectionById(
          collectionId: collectionId),
    );

    return collection;
  }
}
