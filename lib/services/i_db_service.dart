import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';

abstract class IDbService {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String productId});

  /// Wishlist Screen Related Methods
  Future<List<String>> getWishlistProducts();
  Future<void> addProductToWishlist({required String productId});
  Future<void> deleteProductFromWishlist({required String productId});

  /// Shopping Cart Related Methods
  Future<List<CartProductDto>> getShoppingCartProducts();
  Future<void> addProductToShoppingCart(
      {required CartProductDto cartProductDto});
  Future<void> deleteProductFromShoppingCart(
      {required CartProductDto cartProductDto});
}


// TODO: To-be Personal Collections, 'Recommended For You' Section. Above method to-be-called.
// Future<List<Product>> getProductsByFilter({required String filter});
// Future<List<Collection>> getAllCollections();
// Future<List<Collection>> getCollectionById({required String collectionId});




