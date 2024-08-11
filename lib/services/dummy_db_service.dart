import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_user_model.dart';
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

    return dummyUserModel.wishlist;
  }

  @override
  Future<void> addProductToWishlist({required String productId}) async {
    print(
        'DummyDbService addProductToWishlist() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyUserModel.wishlist.add(productId);
  }

  @override
  Future<void> deleteProductFromWishlist({required String productId}) async {
    print(
        'DummyDbService deleteProductFromWishlist() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyUserModel.wishlist.removeWhere((element) => element == productId);
  }

  /// Shopping Cart Screen Related Methods
  @override
  Future<List<CartProductDto>> getShoppingCartProducts() async {
    print(
        'DummyDbService getShoppingCartProducts() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    return dummyUserModel.shoppingCart;
  }

  @override
  Future<bool> addProductToShoppingCart(
      {required CartProductDto cartProductDto}) async {
    print(
        'DummyDbService addProductToShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyUserModel.shoppingCart.add(cartProductDto);

    // Success
    return Future.value(true);
  }

  @override
  Future<bool> deleteProductFromShoppingCart(
      {required CartProductDto cartProductDto}) async {
    print(
        'DummyDbService deleteProductFromShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    dummyUserModel.shoppingCart
        .removeWhere((element) => element.id == cartProductDto.id);

    // Success
    return Future.value(true);
  }

  @override
  Future<bool> updateProductOnShoppingCart(
      {required CartProductDto cartProductDto}) async {
    print(
        'DummyDbService updateProductOnShoppingCart() Executed: "Waiting 0.5 seconds...');
    await Future.delayed(const Duration(milliseconds: 500));

    int updatedIndex = dummyUserModel.shoppingCart
        .indexWhere((element) => element.id == cartProductDto.id);

    dummyUserModel.shoppingCart.removeAt(updatedIndex);

    dummyUserModel.shoppingCart.insert(updatedIndex, cartProductDto);

    // Success
    return Future.value(true);
  }

  @override
  Future<List<Product>> getProductsByFilter({required Filter filter}) async {
    print(
        'DummyDbService getProductsByFilter() Executed: "Waiting 2 seconds...');

    await Future.delayed(const Duration(seconds: 2));

    List<Product> foundProducts = dummyAllProducts.where(
      (element) {
        var tempTitle = element.title.toLowerCase();
        var filterTitle = filter.query!.toLowerCase();
        return tempTitle.contains(filterTitle);
      },
    ).toList();
    return Future.value(foundProducts);
  }
}
