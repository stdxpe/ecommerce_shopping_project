import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_wishlist_repository.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';

final wishlistProvider = AsyncNotifierProvider<WishlistNotifier, List<Product>>(
    () => WishlistNotifier());

class WishlistNotifier extends AsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    /// Initial State Setting Operation
    getWishlistProducts();

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _wishlistManager = locator<IWishlistRepository>();

  getWishlistProducts() async {
    debugPrint('WishlistNotifier | getWishlistProducts() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _wishlistManager.getWishlistProducts(
          userModel: ref.watch(userProvider).value!);
    });
  }

  addProductToWishlist({required Product product}) async {
    debugPrint('WishlistNotifier | addProductToWishlist() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _wishlistManager.addProductToWishlist(
          productId: product.id,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState, product];
      },
    );
  }

  deleteProductFromWishlist({required Product product}) async {
    debugPrint('WishlistNotifier | deleteProductFromWishlist() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _wishlistManager.deleteProductFromWishlist(
          productId: product.id,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState.where((e) => (e.id != product.id))];
      },
    );
  }

  int getWishlistCount() {
    return ((state.value != null && state.value!.isNotEmpty))
        ? state.value!.length
        : 0;
  }
}

final isProductOnWishlist = StateProvider.family<bool, Product>((ref, product) {
  bool result = false;
  var wishlist = ref.watch(wishlistProvider).value;

  result = (wishlist != null &&
      wishlist.isNotEmpty &&
      wishlist.map((e) => e.id).contains(product.id));

  return result;
});

final toggleWishlistButton = Provider.family<void, Product>((ref, product) {
  ref.watch(isProductOnWishlist(product))
      ? ref
          .read(wishlistProvider.notifier)
          .deleteProductFromWishlist(product: product)
      : ref
          .read(wishlistProvider.notifier)
          .addProductToWishlist(product: product);
});
