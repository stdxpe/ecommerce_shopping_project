import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbManager extends IDBRepository {
  var _dbService = locator<IDbService>();

  @override
  Future<List<Product>> getAllProducts() {
    print('DummyDbManager getAllProducts() Executed');
    var allProducts = _dbService.getAllProducts();
    return allProducts;
  }

  /// Wishlist Screen Related Methods
  @override
  Future<List<Product>> getWishlistProducts() async {
    print(
        'DummyDbManager getWishlistProducts() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 2));

    List<Product> foundProducts = [];
    List<String> wishlistProductsId = await _dbService.getWishlistProducts();

    for (var productId in wishlistProductsId) {
      Product foundProduct =
          await _dbService.getProductById(productId: productId);
      foundProducts.add(foundProduct);
    }
    return Future.value(foundProducts);
  }

  @override
  Future<Product> addProductToWishlist({required String productId}) async {
    print(
        'DummyDbManager addProductToWishlist() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 0));

    _dbService.addProductToWishlist(productId: productId);
    var addedProduct = _dbService.getProductById(productId: productId);
    return addedProduct;
  }

  @override
  Future<Product> deleteProductFromWishlist({required String productId}) async {
    print(
        'DummyDbManager deleteProductFromWishlist() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 0));

    _dbService.deleteProductFromWishlist(productId: productId);
    var deletedProduct = _dbService.getProductById(productId: productId);
    return deletedProduct;
  }

  @override
  Future<Product> getProductById({required String productId}) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByFilter({required List<String> filters}) {
    // TODO: implement getProductsByFilter
    throw UnimplementedError();
  }
}
