import 'dart:async';
import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = AsyncNotifierProvider<SearchNotifier, List<Product>>(() {
  return SearchNotifier();
});

class SearchNotifier extends AsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    // getShoppingCartProducts();
    // return await future;
    return [];
  }

  final _dbManager = locator<IDBRepository>();

//  Future<void>
  getSearchProducts(Filter filter) async {
    print('SearchNotifier | getSearchProducts() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _dbManager.getProductsByFilter(filter: filter));
    // Future<List<Product>>
    // var foundProducts = await AsyncValue.guard(
    //      _dbManager.getProductsByFilter(filter: filter));
    // state = foundProducts;
  }

  getProductsByQuery(String query) {
    getSearchProducts(Filter(query: query));
  }

  getFoundProductCount() {
    int productCount = 0;
    if ((state.value != null)) productCount = state.value!.length;
    return productCount;
  }
}
