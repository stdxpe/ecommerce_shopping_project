import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/deprecated/filter.dart';
import 'package:ecommerce_shopping_project/models/deprecated/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';

final searchProvider =
    AutoDisposeAsyncNotifierProvider<SearchNotifier, List<Product>>(() {
  return SearchNotifier();
});

class SearchNotifier extends AutoDisposeAsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    return [];
  }

  final _dbManager = locator<IDBRepository>();

  getProductsByFilter() async {
    print('SearchNotifier | getProductsByFilter() Executed');
    Filter filter = ref.read(filterProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _dbManager.getProductsByFilter(filter: filter));
  }

  getFoundProductCount() {
    int productCount = 0;
    if ((state.value != null)) productCount = state.value!.length;
    return productCount;
  }
}

final searchQueryTextControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  TextEditingController controller = TextEditingController();
  ref.onDispose(
    () {
      controller.dispose();
      print('controller disposed');
    },
  );
  return controller;
});
