import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';

abstract class IDBRepository {
  Future<List<Product>> getAllProducts();
  // Future<Product> getProductById({required String productId});
  // Future<List<Product>> getProductsByFilter({required List<String> filters});

  /// Wishlist Screen Related Methods
  Future<List<Product>> getWishlistProducts();
  Future<Product> addProductToWishlist({required String productId});
  Future<Product> deleteProductFromWishlist({required String productId});

  /// Shopping Cart Screen Related Methods
  Future<List<OrderProduct>> getShoppingCartProducts();
  Future<OrderProduct> addProductToShoppingCart(
      {required OrderProduct orderProduct});
  Future<OrderProduct> deleteProductFromShoppingCart(
      {required OrderProduct orderProduct});
}
