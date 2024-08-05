import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

abstract class IDbService {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String id});
  Future<List<Product>> getProductsByFilter({required String filter});

  Future<List<Product>> getWishlistProducts();
  Future<void> addProductToWishlist({required String productId});
  Future<void> deleteProductFromWishlist({required String productId});

  Future<List<Product>> getShoppingCartProducts();
  Future<void> addProductToShoppingCart({required String productId});
  Future<void> deleteProductFromShoppingCart({required String productId});
}


// Future<List<Collection>> getAllCollections();
// Future<List<Collection>> getCollectionById({required String id});
// /// TODO: To-be Personal Collections, 'Recommended For You' Section. Above method to-be-called.




