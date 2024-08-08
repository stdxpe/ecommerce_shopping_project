import 'package:ecommerce_shopping_project/services/i_db_service.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_cart_product_dto_list.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_wishlist_products.dart';

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

  /// Shopping Cart Screen Related Methods
  @override
  Future<List<CartProductDto>> getShoppingCartProducts() async {
    print(
        'DummyDbService getShoppingCartProducts() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    print('dummyCartProductDtosList : $dummyCartProductDtoList');
    return dummyCartProductDtoList;
  }

  @override
  Future<bool> addProductToShoppingCart(
      {required CartProductDto cartProductDto}) async {
    print(
        'DummyDbService addProductToShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyCartProductDtoList.add(cartProductDto);

    // Success
    return Future.value(true);
  }

  @override
  Future<bool> deleteProductFromShoppingCart(
      {required CartProductDto cartProductDto}) async {
    print(
        'DummyDbService deleteProductFromShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyCartProductDtoList
        .removeWhere((element) => element.id == cartProductDto.id);

    // Success
    return Future.value(true);
  }

  @override
  Future<bool> updateProductOnShoppingCart(
      {required CartProductDto cartProductDto}) {
    int updatedIndex = dummyCartProductDtoList
        .indexWhere((element) => element.id == cartProductDto.id);

    dummyCartProductDtoList.removeAt(updatedIndex);

    dummyCartProductDtoList.insert(updatedIndex, cartProductDto);

    // Success
    return Future.value(true);
  }
}
