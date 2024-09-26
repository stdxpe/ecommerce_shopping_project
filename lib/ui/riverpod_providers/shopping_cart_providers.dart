import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_shopping_cart_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';

final shoppingCartProvider =
    AsyncNotifierProvider<ShoppingCartNotifier, List<CartProduct>>(
        () => ShoppingCartNotifier());

class ShoppingCartNotifier extends AsyncNotifier<List<CartProduct>> {
  @override
  FutureOr<List<CartProduct>> build() async {
    getShoppingCartProducts();
    return await future;
  }

  final _shoppingCartManager = locator<IShoppingCartRepository>();

  getShoppingCartProducts() async {
    debugPrint('ShoppingCartNotifier | getShoppingCartProducts() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _shoppingCartManager.getShoppingCartProducts(
          userModel: ref.watch(userProvider).value!);
    });
  }

  FutureOr<bool> addProductToShoppingCart(
      {required CartProduct cartProduct}) async {
    debugPrint('ShoppingCartNotifier | addProductToShoppingCart() Executed');
    bool result = false;
    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _shoppingCartManager.addProductToShoppingCart(
          cartProduct: cartProduct, userModel: ref.watch(userProvider).value!);

      return [...previousState, cartProduct];
    });

    result = [
      state.value?.firstWhereOrNull((element) => element.id == cartProduct.id)
    ].isNotEmpty;

    return result;
  }

  FutureOr<bool> deleteProductFromShoppingCart(
      {required CartProduct cartProduct}) async {
    debugPrint(
        'ShoppingCartNotifier | deleteProductFromShoppingCart() Executed');
    bool result = false;
    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _shoppingCartManager.deleteProductFromShoppingCart(
          cartProduct: cartProduct, userModel: ref.watch(userProvider).value!);

      return [...previousState.where((e) => (e.id != cartProduct.id))];
    });

    result = [
      state.value?.firstWhereOrNull((element) => element.id == cartProduct.id)
    ].isEmpty;

    return result;
  }

  updateProductOnShoppingCart({required CartProduct cartProduct}) async {
    debugPrint('ShoppingCartNotifier | updateProductOnShoppingCart() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _shoppingCartManager.updateProductOnShoppingCart(
          cartProduct: cartProduct, userModel: ref.watch(userProvider).value!);

      int updatedIndex =
          previousState.indexWhere((element) => element.id == cartProduct.id);

      List<CartProduct> latestList = previousState
          .where((element) => element.id != cartProduct.id)
          .toList();

      latestList.insert(updatedIndex, cartProduct);

      return latestList;
    });
  }

  resetShoppingCartAfterCheckout() async {
    debugPrint(
        'ShoppingCartNotifier | resetShoppingCartAfterCheckout() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _shoppingCartManager.resetShoppingCartAfterCheckout(
            userModel: ref.watch(userProvider).value!);

        return [];
      },
    );
  }

  int getShoppingCartCount() {
    return ((state.value != null || state.value!.isNotEmpty))
        ? state.value?.length ?? 0
        : 0;
  }

  double getTotalAmount() {
    double totalAmount = 0;
    if ((state.value != null || state.value!.isNotEmpty)) {
      for (var element in state.value!) {
        totalAmount = totalAmount + element.selectedProduct.price;
      }
    }
    return totalAmount;
  }

  double getShippingFee() {
    double totalShippingFee = 0;
    if ((state.value != null || state.value!.isNotEmpty)) {
      totalShippingFee = state.value!.first.selectedProduct.shippingFee;
    }
    return totalShippingFee;
  }

  increaseItemCounter({required CartProduct cartProduct}) async {
    int newItemCount = cartProduct.itemCount + 1;
    CartProduct newCartProduct = cartProduct.copyWith(itemCount: newItemCount);
    await updateProductOnShoppingCart(cartProduct: newCartProduct);
  }

  decreaseItemCounter({required CartProduct cartProduct}) async {
    if (cartProduct.itemCount > 1) {
      int newItemCount = cartProduct.itemCount - 1;
      CartProduct newCartProduct =
          cartProduct.copyWith(itemCount: newItemCount);
      await updateProductOnShoppingCart(cartProduct: newCartProduct);
    }
  }

  continueToPayment({required BuildContext context}) {
    if (state.value != null && state.value!.isNotEmpty) {
      context.push(Routes.paymentStepShipping);
    }
  }
}
