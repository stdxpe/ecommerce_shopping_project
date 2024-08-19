import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IWishlistRepository {
  Future<List<Product>> getWishlistProducts({
    required UserModel userModel,
  });

  Future<void> addProductToWishlist({
    required String productId,
    required UserModel userModel,
  });

  Future<void> deleteProductFromWishlist({
    required String productId,
    required UserModel userModel,
  });
}
