import 'dart:async';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  FutureOr<bool> addProductToShoppingCart(
      {required CartProduct cartProduct}) async {
    print('ShoppingCartNotifier | addProductToShoppingCart() Executed');

    bool result = false;
    var previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        result =
            await _dbManager.addProductToShoppingCart(cartProduct: cartProduct);

        if (result) {
          return [...previousState, cartProduct];
        } else {
          return previousState;
        }
      },
    );
    return result;
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

  getShoppingCartCount() {
    int productCount = 0;
    if ((state.value != null)) productCount = state.value!.length;
    return productCount;
  }

  getTotalAmount() {
    double totalAmount = 0;

    if ((state.value != null)) {
      for (var element in state.value!) {
        totalAmount = totalAmount + element.selectedProduct.price;
      }
    }
    return totalAmount;
  }

  getShippingFee() {
    double totalShippingFee = 0;

    if ((state.value != null)) {
      for (var e in state.value!) {
        if (e.selectedProduct.shippingFee != null) {
          totalShippingFee = totalShippingFee + e.selectedProduct.shippingFee!;
        }
      }
    }
    return totalShippingFee;
  }

  increaseItemCounter({required CartProduct cartProduct}) async {
    print('ShoppingCartNotifier | increaseItemCounter() Executed');

    /// TODO: CartProduct copyWith method!
    ///
    int newItemCount = cartProduct.itemCount + 1;

    CartProduct newCartProduct = CartProduct(
      id: cartProduct.id,
      selectedProduct: cartProduct.selectedProduct,
      selectedColor: cartProduct.selectedColor,
      selectedSize: cartProduct.selectedSize,
      itemCount: newItemCount,
    );
    updateProductOnShoppingCart(cartProduct: newCartProduct);
  }

  decreaseItemCounter({required CartProduct cartProduct}) async {
    /// TODO: CartProduct copyWith method!
    ///
    if (cartProduct.itemCount > 1) {
      print('ShoppingCartNotifier | decreaseItemCounter() Executed');
      int newItemCount = cartProduct.itemCount - 1;

      CartProduct newCartProduct = CartProduct(
        id: cartProduct.id,
        selectedProduct: cartProduct.selectedProduct,
        selectedColor: cartProduct.selectedColor,
        selectedSize: cartProduct.selectedSize,
        itemCount: newItemCount,
      );
      updateProductOnShoppingCart(cartProduct: newCartProduct);
    }
  }

  continueToPaymentButton({required BuildContext context}) {
    if (state.value != null && state.value!.isNotEmpty) {
      context.push(Routes.paymentStepShipping);
    }
  }
}
