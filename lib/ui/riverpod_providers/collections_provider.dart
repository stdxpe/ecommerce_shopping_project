import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

final collectionsProvider =
    AsyncNotifierProvider<CollectionNotifier, List<Collection>>(
        () => CollectionNotifier());

class CollectionNotifier extends AsyncNotifier<List<Collection>> {
  @override
  FutureOr<List<Collection>> build() async {
    getAllCollections();
    return await future;
  }

  final _collectionManager = locator<ICollectionRepository>();

  getAllCollections() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await _collectionManager.getAllCollections(),
    );
  }
}

enum Collections {
  summer,
  windsOfWinter,
  fallEssentials,
  dreamOfSpring,
  designer,
}

final selectedCollectionIndex =
    Provider.family<int, Collections>((ref, collection) {
  return switch (collection) {
    Collections.summer => 0,
    Collections.windsOfWinter => 1,
    Collections.fallEssentials => 2,
    Collections.dreamOfSpring => 3,
    Collections.designer => 4,
  };
});

final getCollection =
    Provider.family<Collection, Collections>((ref, collectionEnum) {
  List<Collection> collections = ref.watch(collectionsProvider).value!;

  return switch (collectionEnum) {
    Collections.summer => collections[0],
    Collections.windsOfWinter => collections[1],
    Collections.fallEssentials => collections[2],
    Collections.dreamOfSpring => collections[3],
    Collections.designer => collections[4],
  };
});

final getCollectionTitle =
    Provider.family<String, Collections>((ref, collection) {
  return switch (collection) {
    Collections.designer => AppStrings.designerCollection,
    Collections.windsOfWinter => AppStrings.windsOfWinterCollection,
    Collections.dreamOfSpring => AppStrings.dreamOfSpringCollection,
    Collections.fallEssentials => AppStrings.fallEssentialsCollection,
    Collections.summer => AppStrings.summerCollection,
  };
});

final getCollectionEnum = Provider.family<Collections, String>((ref, title) {
  if (title.contains('Summer')) {
    return Collections.summer;
  } else if (title.contains('Fall')) {
    return Collections.fallEssentials;
  } else if (title.contains('Spring')) {
    return Collections.dreamOfSpring;
  } else if (title.contains('Winter')) {
    return Collections.windsOfWinter;
  } else if (title.contains('Designer')) {
    return Collections.designer;
  } else {
    return Collections.summer;
  }
});

typedef CollectionCountInputs = ({
  int? itemCount,
  int itemStartIndex,
  AsyncNotifierProvider provider,
  int collectionIndex,
});

final getCollectionItemCount =
    StateProvider.family<int, CollectionCountInputs>((ref, inputs) {
  int? productLength =
      ref.watch(inputs.provider).value?[inputs.collectionIndex].products.length;
  if (productLength == null) {
    return inputs.itemCount ?? 6;
  } else if (inputs.itemCount == null) {
    return productLength - inputs.itemStartIndex;
  } else if (inputs.itemCount != null) {
    return ((productLength - inputs.itemStartIndex)) < inputs.itemCount!
        ? (productLength - inputs.itemStartIndex)
        : inputs.itemCount!;
  } else {
    return inputs.itemCount ?? 6;
  }
});
