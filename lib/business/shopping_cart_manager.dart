import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_shopping_cart_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class ShoppingCartManager extends IShoppingCartRepository {
  final _productService = locator<IProductService>();
  final _userService = locator<IUserService>();

  @override
  Future<List<CartProduct>> getShoppingCartProducts(
      {required UserModel userModel}) async {
    try {
      debugPrint('ShoppingCartManager getShoppingCartProducts try block exec');

      List<CartProduct> shoppingCartProducts = [];

      for (var cartItem in userModel.shoppingCart) {
        Product? selectedProduct = await _productService.getProductById(
            productId: cartItem.selectedProductId);

        if (selectedProduct != null) {
          CartProduct temp = CartProduct(
              id: cartItem.id,
              selectedProduct: selectedProduct,
              selectedColor: cartItem.selectedColor,
              selectedSize: cartItem.selectedSize,
              itemCount: cartItem.itemCount);

          shoppingCartProducts.add(temp);
        }
      }
      return shoppingCartProducts;
    } on Exception catch (_) {
      debugPrint(
          'ShoppingCartManager getShoppingCartProducts catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ShoppingCartManager getShoppingCartProducts catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> addProductToShoppingCart({
    required CartProduct cartProduct,
    required UserModel userModel,
  }) async {
    try {
      debugPrint('ShoppingCartManager addProductToShoppingCart try block exec');

      CartProductDto temp = CartProductDto(
          id: cartProduct.id,
          selectedProductId: cartProduct.selectedProduct.id,
          selectedColor: cartProduct.selectedColor,
          selectedSize: cartProduct.selectedSize,
          itemCount: cartProduct.itemCount);

      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;
      tempShoppingCart.add(temp);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      debugPrint(
          'ShoppingCartManager addProductToShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ShoppingCartManager addProductToShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> updateProductOnShoppingCart(
      {required CartProduct cartProduct, required UserModel userModel}) async {
    try {
      debugPrint(
          'ShoppingCartManager updateProductOnShoppingCart try block exec');
      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;

      int updatedIndex = tempShoppingCart
          .indexWhere((element) => element.id == cartProduct.id);

      tempShoppingCart.removeAt(updatedIndex);

      CartProductDto newCartDto = CartProductDto(
          id: cartProduct.id,
          selectedProductId: cartProduct.selectedProduct.id,
          selectedColor: cartProduct.selectedColor,
          selectedSize: cartProduct.selectedSize,
          itemCount: cartProduct.itemCount);

      tempShoppingCart.insert(updatedIndex, newCartDto);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      debugPrint(
          'ShoppingCartManager updateProductOnShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ShoppingCartManager updateProductOnShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteProductFromShoppingCart(
      {required CartProduct cartProduct, required UserModel userModel}) async {
    try {
      debugPrint(
          'ShoppingCartManager deleteProductFromShoppingCart try block exec');

      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;

      tempShoppingCart.removeWhere((element) => element.id == cartProduct.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      debugPrint(
          'ShoppingCartManager deleteProductFromShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ShoppingCartManager deleteProductFromShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> resetShoppingCartAfterCheckout(
      {required UserModel userModel}) async {
    try {
      debugPrint(
          'ShoppingCartManager resetShoppingCartAfterCheckout try block exec');

      List<CartProductDto> tempEmptyShoppingCart = [];

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempEmptyShoppingCart));
    } on Exception catch (_) {
      debugPrint(
          'ShoppingCartManager resetShoppingCartAfterCheckout catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ShoppingCartManager resetShoppingCartAfterCheckout catch error block exec, rethrowing');
      rethrow;
    }
  }
}
