import 'dart:async';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_shopping_project/models/deprecated/product.dart';

final isProductOnWishlist =
    StateProvider.family<bool, String>((ref, productId) {
  return ((ref.watch(wishlistProvider).value != null) &&
          (ref
              .watch(wishlistProvider)
              .value!
              .where((e) => e.id == productId)
              .isNotEmpty))
      ? true
      : false;
});

final toggleWishlistButtonProvider =
    StateProvider.family<void, String>((ref, productId) {
  (ref.watch(isProductOnWishlist(productId)))
      ? ref
          .read(wishlistProvider.notifier)
          .deleteProductFromWishlist(productId: productId)
      : ref
          .read(wishlistProvider.notifier)
          .addProductToWishlist(productId: productId);
});

final wishlistProvider =
    AsyncNotifierProvider<WishlistNotifier, List<Product>>(() {
  return WishlistNotifier();
});

class WishlistNotifier extends AsyncNotifier<List<Product>> {
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

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        Product addedProduct =
            await _dbManager.addProductToWishlist(productId: productId);

        return [...previousState, addedProduct];
      },
    );
  }

  deleteProductFromWishlist({required String productId}) async {
    print('WishlistScreenNotifier | deleteProductFromWishlist() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        Product deletedProduct =
            await _dbManager.deleteProductFromWishlist(productId: productId);

        return [...previousState.where((e) => (e.id != deletedProduct.id))];
      },
    );
  }

  getWishlistCount() {
    int productCount = 0;
    if ((state.value != null)) productCount = state.value!.length;
    return productCount;
  }
}
