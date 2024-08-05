import 'package:ecommerce_shopping_project/models/product.dart';

abstract class IDBRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String productId});
  Future<List<Product>> getProductsByFilter({required List<String> filters});

  /// Wishlist Screen Related Methods
  Future<List<Product>> getWishlistProducts();
  Future<Product> addProductToWishlist({required String productId});
  Future<Product> deleteProductFromWishlist({required String productId});
}
