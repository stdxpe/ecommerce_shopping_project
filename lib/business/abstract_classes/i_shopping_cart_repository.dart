import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IShoppingCartRepository {
  Future<List<CartProduct>> getShoppingCartProducts({
    required UserModel userModel,
  });

  Future<void> addProductToShoppingCart({
    required CartProduct cartProduct,
    required UserModel userModel,
  });

  Future<void> updateProductOnShoppingCart({
    required CartProduct cartProduct,
    required UserModel userModel,
  });

  Future<void> deleteProductFromShoppingCart({
    required CartProduct cartProduct,
    required UserModel userModel,
  });
}
