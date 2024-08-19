import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_wishlist_repository.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class WishlistManager extends IWishlistRepository {
  final _productService = locator<IProductService>();
  final _userService = locator<IUserService>();

  @override
  Future<List<Product>> getWishlistProducts(
      {required UserModel userModel}) async {
    try {
      print('WishlistManager getWishlistProducts try block exec');

      List<Product> wishlistProducts = [];

      for (var productId in userModel.wishlist) {
        Product? selectedProduct = await _productService.getProductById(
            productId: productId, sourcePath: 'products');

        if (selectedProduct != null) wishlistProducts.add(selectedProduct);
      }
      return wishlistProducts;
    } on Exception catch (_) {
      print(
          'WishlistManager getWishlistProducts catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'WishlistManager getWishlistProducts catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> addProductToWishlist(
      {required String productId, required UserModel userModel}) async {
    try {
      print('WishlistManager addProductToWishlist try block exec');

      List<String> tempWishlist = userModel.wishlist;
      tempWishlist.add(productId);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(wishlist: tempWishlist));
    } on Exception catch (_) {
      print(
          'WishlistManager addProductToWishlist catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'WishlistManager addProductToWishlist catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteProductFromWishlist(
      {required String productId, required UserModel userModel}) async {
    try {
      print('WishlistManager deleteProductFromWishlist try block exec');

      List<String> tempWishlist = userModel.wishlist;
      tempWishlist.removeWhere((element) => element == productId);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(wishlist: tempWishlist));
    } on Exception catch (_) {
      print(
          'WishlistManager deleteProductFromWishlist catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'WishlistManager deleteProductFromWishlist catch error block exec, rethrowing');
      rethrow;
    }
  }
}
