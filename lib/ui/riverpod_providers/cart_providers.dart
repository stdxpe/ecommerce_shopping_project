import 'dart:async';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartProvider =
    AsyncNotifierProvider<ShoppingCartNotifier, List<CartProduct>>(
  () {
    return ShoppingCartNotifier();
  },
);

class ShoppingCartNotifier extends AsyncNotifier<List<CartProduct>> {
  @override
  FutureOr<List<CartProduct>> build() async {
    getShoppingCartProducts();
    return await future;
  }

  final _dbManager = locator<IDBRepository>();

  getShoppingCartProducts() async {
    print('ShoppingCartNotifier | getShoppingCartProducts() Executed');

    state = const AsyncLoading();
    var allCartProducts =
        await AsyncValue.guard(_dbManager.getShoppingCartProducts);
    state = allCartProducts;
  }

  addProductToShoppingCart({required CartProduct cartProduct}) async {
    print('ShoppingCartNotifier | addProductToShoppingCart() Executed');

    var previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        var result =
            await _dbManager.addProductToShoppingCart(cartProduct: cartProduct);

        if (result) {
          return [...previousState, cartProduct];
        } else {
          return previousState;
        }
      },
    );
  }

  deleteProductFromShoppingCart({required CartProduct cartProduct}) async {
    print('ShoppingCartNotifier | deleteProductFromShoppingCart() Executed');

    var previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        var result = await _dbManager.deleteProductFromShoppingCart(
            cartProduct: cartProduct);

        if (result) {
          var listWithDeletedCartProduct = previousState
              .where((element) => element.id != cartProduct.id)
              .toList();
          return listWithDeletedCartProduct;
        } else {
          return previousState;
        }
      },
    );
  }

  updateProductOnShoppingCart({required CartProduct cartProduct}) async {
    print('ShoppingCartNotifier | updateProductOnShoppingCart() Executed');

    var previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        var result = await _dbManager.updateProductOnShoppingCart(
            cartProduct: cartProduct);

        if (result) {
          var updatedIndex = previousState
              .indexWhere((element) => element.id == cartProduct.id);

          var latestList = previousState
              .where((element) => element.id != cartProduct.id)
              .toList();

          latestList.insert(updatedIndex, cartProduct);

          return latestList;
        } else {
          return previousState;
        }
      },
    );
  }

  getTotalAmount() {
    return 123;
  }

  getShippingFee() {
    return 5.99;
  }

  getShoppingCartLength() {
    return 3;
  }
}
