import 'package:ecommerce_shopping_project/models/product.dart';

abstract class IDbService {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String id});
  Future<List<Product>> getProductsByFilter({required String filter});
}

// CRUD

// getWishlistProducts()
// addProductToWishlist({required String id})
// deleteProductFromWishlist({required String id})

// getCartProducts()
// addProductToCart({required String id})
// deleteProductFromCart({required String id})

