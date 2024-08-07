import 'package:ecommerce_shopping_project/models/order_product_dto.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_shopping_cart_order_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_wishlist_products.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbService extends IDbService {
  @override
  Future<List<Product>> getAllProducts() async {
    print('DummyDbService getAllProducts() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 2));
    List<Product> productsList = dummyAllProducts;

    /// TODO: FromJSON methods here.
    /// dummyProductJsonList.map((e) => Product.fromJson(e)).toList();
    return await Future.value(productsList);
  }

  @override
  Future<Product> getProductById({required String productId}) async {
    print('DummyDbService getProductById() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));
    Product foundProduct =
        dummyAllProducts.firstWhere((element) => element.id == productId);
    return foundProduct;
  }

  /// Wishlist Screen Related Methods
  @override
  Future<List<String>> getWishlistProducts() async {
    print(
        'DummyDbService getWishlistProducts() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    return dummyWishlistProductsId;
  }

  @override
  Future<void> addProductToWishlist({required String productId}) async {
    print(
        'DummyDbService addProductToWishlist() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyWishlistProductsId.add(productId);
  }

  @override
  Future<void> deleteProductFromWishlist({required String productId}) async {
    print(
        'DummyDbService deleteProductFromWishlist() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyWishlistProductsId.removeWhere((element) => element == productId);
  }

//   @override
//   Future<List<Product>> getWishlistProducts() async {
//     print(
//         'DummyDbService getWishlistProducts() Executed: "Waiting 2 seconds...');
//     await Future.delayed(const Duration(seconds: 2));
//     List<Product> productsList = dummyWishlistProducts;
//     return await Future.value(productsList);
//   }

//   @override
//   Future<void> addProductToWishlist({required String productId}) async {
//     print(
//         'DummyDbService addProductToWishlist() Executed: "Waiting 2 seconds...');
//     await Future.delayed(const Duration(seconds: 2));

// dummyWishlistProducts.add(value)
//   }

//   @override
//   Future<void> deleteProductFromWishlist({required String productId}) {
//     // TODO: implement deleteProductFromWishlist
//     throw UnimplementedError();
//   }

  /// Shopping Cart Screen Related Methods
  @override
  Future<List<OrderProductDto>> getShoppingCartProducts() async {
    print(
        'DummyDbService getShoppingCartProducts() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    return dummyShoppingCartOrderProductDtos;
  }

  @override
  Future<void> addProductToShoppingCart(
      {required OrderProductDto orderProductDto}) async {
    print(
        'DummyDbService addProductToShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyShoppingCartOrderProductDtos.add(orderProductDto);
  }

  @override
  Future<void> deleteProductFromShoppingCart(
      {required OrderProductDto orderProductDto}) async {
    print(
        'DummyDbService deleteProductFromShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyShoppingCartOrderProductDtos
        .removeWhere((element) => element.id == orderProductDto.id);
  }
}
