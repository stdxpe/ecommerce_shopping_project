import 'dart:async';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_wishlist_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

final wishlistScreenProvider =
    AsyncNotifierProvider<WishlistScreenNotifier, List<Product>>(() {
  return WishlistScreenNotifier();
});

class WishlistScreenNotifier extends AsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    /// Initial State Setting Operation
    getWishlistProducts();

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _dbManager = locator<IDBRepository>();

  getWishlistProducts() async {
    print('WishlistScreenNotifier | getWishlistProducts() Executed');

    state = const AsyncLoading();
    var allProducts = await AsyncValue.guard(_dbManager.getWishlistProducts);
    state = allProducts;
    return allProducts;
  }

  addProductToWishlist({required String productId}) async {
    print('WishlistScreenNotifier | addProductToWishlist() Executed');
    print(dummyWishlistProductsId);

    final previousState = await future;
    print('previousState : $previousState');
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        Product addedProduct =
            await _dbManager.addProductToWishlist(productId: productId);

        print('addedProduct: ${addedProduct.title}');

        return [...previousState, addedProduct];
      },
    );
    print('latestState : $state');
    print(dummyWishlistProductsId);
  }

  deleteProductFromWishlist({required String productId}) async {
    print('WishlistScreenNotifier | deleteProductFromWishlist() Executed');
    print(dummyWishlistProductsId);

    final previousState = await future;
    print('previousState : $previousState');
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        Product deletedProduct =
            await _dbManager.deleteProductFromWishlist(productId: productId);

        print('deletedProduct: ${deletedProduct.title}');

        // return [...previousState, addedProduct];
        return [...previousState.where((e) => (e.id != deletedProduct.id))];
      },
    );
    print('latestState : $state');
    print(dummyWishlistProductsId);
  }
}
