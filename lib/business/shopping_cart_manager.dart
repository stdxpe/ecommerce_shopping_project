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
      print('ShoppingCartManager getShoppingCartProducts try block exec');

      List<CartProduct> shoppingCartProducts = [];

      for (var cartItem in userModel.shoppingCart) {
        Product? selectedProduct = await _productService.getProductById(
            productId: cartItem.selectedProductId, sourcePath: 'products');

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
      print(
          'ShoppingCartManager getShoppingCartProducts catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
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
      print('ShoppingCartManager addProductToShoppingCart try block exec');

      CartProductDto temp = CartProductDto(
          id: cartProduct.id,
          selectedProductId: cartProduct.id,
          selectedColor: cartProduct.selectedColor,
          selectedSize: cartProduct.selectedSize,
          itemCount: cartProduct.itemCount);

      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;
      tempShoppingCart.add(temp);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      print(
          'ShoppingCartManager addProductToShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'ShoppingCartManager addProductToShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> updateProductOnShoppingCart(
      {required CartProduct cartProduct, required UserModel userModel}) async {
    try {
      print('ShoppingCartManager updateProductOnShoppingCart try block exec');
      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;

      int updatedIndex = tempShoppingCart
          .indexWhere((element) => element.id == cartProduct.id);

      tempShoppingCart.removeAt(updatedIndex);

      tempShoppingCart.insert(
          updatedIndex, CartProductDto.fromMap(cartProduct.toMap()));

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      print(
          'ShoppingCartManager updateProductOnShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'ShoppingCartManager updateProductOnShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteProductFromShoppingCart(
      {required CartProduct cartProduct, required UserModel userModel}) async {
    try {
      print('ShoppingCartManager deleteProductFromShoppingCart try block exec');

      List<CartProductDto> tempShoppingCart = userModel.shoppingCart;

      tempShoppingCart.removeWhere((element) => element.id == cartProduct.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(shoppingCart: tempShoppingCart));
    } on Exception catch (_) {
      print(
          'ShoppingCartManager deleteProductFromShoppingCart catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'ShoppingCartManager deleteProductFromShoppingCart catch error block exec, rethrowing');
      rethrow;
    }
  }
}
