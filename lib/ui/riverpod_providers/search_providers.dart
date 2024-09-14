import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';

final searchProvider =
    AutoDisposeAsyncNotifierProvider<SearchNotifier, List<Product>>(
        () => SearchNotifier());

class SearchNotifier extends AutoDisposeAsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async => [];

  final _collectionManager = locator<ICollectionRepository>();

  getProductsByFilter() async {
    debugPrint('SearchNotifier | getProductsByFilter() Executed');
    Filter filter = ref.read(filterProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        debugPrint('Guard block exec');
        return await _collectionManager.getCollectionByFilter(filter: filter);
      },
      (error) {
        debugPrint('Provider error block exec | ${error.runtimeType} | $error');
        return error is Exception || error is Error;
      },
    );
  }

  getFoundProductsCount() {
    int productCount = 0;
    if ((state.value != null)) productCount = state.value!.length;
    return productCount;
  }
}

final searchQueryTextControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  TextEditingController controller = TextEditingController();
  ref.onDispose(
    () => controller.dispose(),
  );
  return controller;
});
