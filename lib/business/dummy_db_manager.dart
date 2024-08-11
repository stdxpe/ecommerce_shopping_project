import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbManager extends IDBRepository {
  final _dbService = locator<IDbService>();

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
  Future<List<CartProduct>> getShoppingCartProducts() async {
    print(
        'DummyDbManager getShoppingCartProducts() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 2));

    List<CartProduct> cartProducts = [];
    var dtos = await _dbService.getShoppingCartProducts();
    for (var dto in dtos) {
      var product =
          await _dbService.getProductById(productId: dto.selectedProductId);

      CartProduct cartProduct = CartProduct(
        id: dto.id,
        selectedProduct: product,
        selectedColor: dto.selectedColor,
        selectedSize: dto.selectedSize,
        itemCount: dto.itemCount,
      );

      cartProducts.add(cartProduct);
    }
    return Future.value(cartProducts);
  }

  @override
  Future<bool> addProductToShoppingCart(
      {required CartProduct cartProduct}) async {
    print(
        'DummyDbManager addProductToShoppingCart() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 0));

// TODO: CartProduct named Ctor : CartProduct.fromDTO() method
// TODO: CartProduct copyWith method

    CartProductDto cartProductDto = CartProductDto(
        id: cartProduct.id,
        selectedProductId: cartProduct.selectedProduct.id,
        selectedColor: cartProduct.selectedColor,
        selectedSize: cartProduct.selectedSize,
        itemCount: cartProduct.itemCount);

    return _dbService.addProductToShoppingCart(cartProductDto: cartProductDto);
  }

  @override
  Future<bool> deleteProductFromShoppingCart(
      {required CartProduct cartProduct}) async {
    print(
        'DummyDbManager deleteProductFromShoppingCart() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 0));

    CartProductDto cartProductDto = CartProductDto(
        id: cartProduct.id,
        selectedProductId: cartProduct.selectedProduct.id,
        selectedColor: cartProduct.selectedColor,
        selectedSize: cartProduct.selectedSize,
        itemCount: cartProduct.itemCount);

    return _dbService.deleteProductFromShoppingCart(
        cartProductDto: cartProductDto);
  }

  @override
  Future<bool> updateProductOnShoppingCart(
      {required CartProduct cartProduct}) async {
    print(
        'DummyDbManager updateProductOnShoppingCart() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 0));

    CartProductDto cartProductDto = CartProductDto(
        id: cartProduct.id,
        selectedProductId: cartProduct.selectedProduct.id,
        selectedColor: cartProduct.selectedColor,
        selectedSize: cartProduct.selectedSize,
        itemCount: cartProduct.itemCount);

    return _dbService.updateProductOnShoppingCart(
        cartProductDto: cartProductDto);
  }

  @override
  Future<List<Product>> getProductsByFilter({required Filter filter}) async {
    print(
        'DummyDbManager getProductsByFilter() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 2));

    return _dbService.getProductsByFilter(filter: filter);
  }

  // @override
  // Future<Product> getProductById({required String productId}) async {
  //   await Future.delayed(const Duration(seconds: 0));

  //   return _dbService.getProductById(productId: productId);
  // }

  // /// Shopping Cart Screen Related Methods
  // @override
  // Future<List<CartProduct>> getShoppingCartProducts() async {
  //   print(
  //       'DummyDbManager getShoppingCartProducts() Executed: "Waiting 2 seconds...');
  //   await Future.delayed(const Duration(seconds: 2));

  //   List<CartProductDto> orderProductDtos =
  //       await _dbService.getShoppingCartProducts();

  //   List<CartProduct> orderProducts = [];

  //   for (var dto in orderProductDtos) {
  //     Product selectedProduct =
  //         await _dbService.getProductById(productId: dto.selectedProductId);

  //     CartProduct orderProduct = CartProduct(
  //         id: dto.id,
  //         selectedProduct: selectedProduct,
  //         selectedColor: dto.selectedColor,
  //         selectedSize: dto.selectedSize,
  //         itemCount: dto.itemCount);
  //     orderProducts.add(orderProduct);
  //   }
  //   return Future.value(orderProducts);
  // }

  // @override
  // Future<CartProduct> addProductToShoppingCart(
  //     {required CartProduct cartProduct}) async {
  //   print(
  //       'DummyDbManager addProductToShoppingCart() Executed: "Waiting 2 seconds...');
  //   await Future.delayed(const Duration(seconds: 0));

  //   CartProductDto orderProductDto = CartProductDto(
  //       id: cartProduct.id,
  //       selectedProductId: cartProduct.selectedProduct.id,
  //       selectedColor: cartProduct.selectedColor,
  //       selectedSize: cartProduct.selectedSize,
  //       itemCount: cartProduct.itemCount);

  //   _dbService.addProductToShoppingCart(cartProductDto: orderProductDto);
  //   return cartProduct;
  // }

  // @override
  // Future<CartProduct> deleteProductFromShoppingCart(
  //     {required CartProduct cartProduct}) async {
  //   print(
  //       'DummyDbManager deleteProductFromShoppingCart() Executed: "Waiting 2 seconds...');
  //   await Future.delayed(const Duration(seconds: 0));

  //   CartProductDto orderProductDto = CartProductDto(
  //       id: cartProduct.id,
  //       selectedProductId: cartProduct.selectedProduct.id,
  //       selectedColor: cartProduct.selectedColor,
  //       selectedSize: cartProduct.selectedSize,
  //       itemCount: cartProduct.itemCount);

  //   _dbService.deleteProductFromShoppingCart(cartProductDto: orderProductDto);

  //   return cartProduct;
  // }

  // @override
  // Future<CartProduct> updateProductOnShoppingCart(
  //     {required CartProduct cartProduct}) {
  //   // TODO: implement updateProductOnShoppingCart
  //   throw UnimplementedError();
  // }
}
