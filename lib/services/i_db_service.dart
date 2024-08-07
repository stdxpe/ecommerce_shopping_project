import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';

abstract class IDbService {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String productId});
  // Future<List<Product>> getProductsByFilter({required String filter});

  /// Wishlist Screen Related Methods

  Future<List<String>> getWishlistProducts();
  Future<void> addProductToWishlist({required String productId});
  Future<void> deleteProductFromWishlist({required String productId});

  /// Shopping Cart Related Methods
  Future<List<OrderProduct>> getShoppingCartProducts();
  Future<void> addProductToShoppingCart({required OrderProduct orderProduct});
  Future<void> deleteProductFromShoppingCart(
      {required OrderProduct orderProduct});
}


// Future<List<Collection>> getAllCollections();
// Future<List<Collection>> getCollectionById({required String collectionId});
// /// TODO: To-be Personal Collections, 'Recommended For You' Section. Above method to-be-called.




