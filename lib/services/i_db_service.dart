import 'package:ecommerce_shopping_project/models/deprecated/filter.dart';
import 'package:ecommerce_shopping_project/models/deprecated/product.dart';
import 'package:ecommerce_shopping_project/models/new/cart_product_dto.dart';

abstract class IDbService {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String productId});
  Future<List<Product>> getProductsByFilter({required Filter filter});

  /// Wishlist Screen Related Methods
  Future<List<String>> getWishlistProducts();
  Future<void> addProductToWishlist({required String productId});
  Future<void> deleteProductFromWishlist({required String productId});

  /// Shopping Cart Related Methods
  Future<List<CartProductDto>> getShoppingCartProducts();
  Future<bool> addProductToShoppingCart(
      {required CartProductDto cartProductDto});
  Future<bool> deleteProductFromShoppingCart(
      {required CartProductDto cartProductDto});
  Future<bool> updateProductOnShoppingCart(
      {required CartProductDto cartProductDto});
}


// TODO: To-be Personal Collections, 'Recommended For You' Section. Below methods to-be-called.
// Future<List<Collection>> getAllCollections();
// Future<List<Collection>> getCollectionById({required String collectionId});




