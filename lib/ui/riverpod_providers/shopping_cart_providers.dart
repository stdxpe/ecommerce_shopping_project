import 'dart:async';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_cart_product_dto_list.dart';

final productProvider =
    FutureProvider.family<Product, String>((ref, productId) async {
  final _dbService = locator<IDbService>();
  var product = _dbService.getProductById(productId: productId);
  return product;
});

// final productProvider = StateProvider.family<Product, String>((ref, productId) {
//   final _dbService = locator<IDbService>();
//   var product = await _dbService.getProductById(productId: productId);
//   return product;
// });

// final productProvider = StateProvider.family<Product, String>((ref, productId) {
// //   final _dbManager = locator<IDBRepository>();
//   var product = ref
//       .read(shoppingCartProvider.notifier)
//       .getProductOfOrderProductWithProductId(productId: productId);
//   return product;
// });

// final shoppingCartProductProviderWithProductId = StateProvider<Product>((ref) { return;});

// final shoppingCartProductProviderWithProductId =
//     StateProvider.family<Product, String>((ref, productId) {
//   final _dbManager = locator<IDBRepository>();
//   var product = _dbManager.getProductById(productId: productId);
//   return product;
// });

// final shoppingCartProductProviderWithProductId = AsyncNotifierProvider<
//     ShoppingCartProductProviderWithProductIdNotifier,
//     Product>(() => ShoppingCartProductProviderWithProductIdNotifier());

// class ShoppingCartProductProviderWithProductIdNotifier
//     extends AsyncNotifier<Product> {
//   @override
//   FutureOr<Product> build() async {
//     return dummyAllProducts[0];
//   }

//   final _dbManager = locator<IDBRepository>();

//   getProduct({required String productId}) async {
//     print('ShoppingCartNotifier | getShoppingCartProducts() Executed');

//     state = const AsyncLoading();
//     var product =
//         await AsyncValue.guard(_dbManager.getProductById(productId: productId));
//     state = product;
//     return product;
//     // await _dbManager.getProductById(productId: productId);
//     // return
//   }
// }

final shoppingCartProvider =
    AsyncNotifierProvider<ShoppingCartNotifier, List<CartProduct>>(
        () => ShoppingCartNotifier());

class ShoppingCartNotifier extends AsyncNotifier<List<CartProduct>> {
  @override
  FutureOr<List<CartProduct>> build() async {
    getShoppingCartProducts();
    return await future;
  }

  final _dbManager = locator<IDBRepository>();

  getShoppingCartProducts() async {
    print('ShoppingCartNotifier | getShoppingCartProducts() Executed');

    state = const AsyncLoading();
    var allProducts =
        await AsyncValue.guard(_dbManager.getShoppingCartProducts);
    state = allProducts;
    return allProducts;
  }

  addProductToShoppingCart({required CartProduct orderProduct}) async {
    print('ShoppingCartNotifier | addProductToShoppingCart() Executed');

    final previousStateOfShoppingCart = await future;
    print('previousStateOfShoppingCart : $previousStateOfShoppingCart');
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        CartProduct addedOrderProduct = await _dbManager
            .addProductToShoppingCart(orderProduct: orderProduct);

        print('addedOrderProduct: ${addedOrderProduct.selectedProduct.title}');

        return [...previousStateOfShoppingCart, addedOrderProduct];
      },
    );
    print('latestState : $state');
    print(dummyCartProductDtoList);
  }

  deleteProductFromShoppingCart({required CartProduct orderProduct}) async {
    print('ShoppingCartNotifier | deleteProductFromShoppingCart() Executed');
    print(dummyCartProductDtoList);

    final previousStateOfShoppingCart = await future;
    print('previousStateOfShoppingCart : $previousStateOfShoppingCart');
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        CartProduct deletedOrderProduct = await _dbManager
            .deleteProductFromShoppingCart(orderProduct: orderProduct);

        print(
            'deletedOrderProduct: ${deletedOrderProduct.selectedProduct.title}');

        return [
          ...previousStateOfShoppingCart
              .where((e) => (e.id != deletedOrderProduct.id))
        ];
      },
    );
    print('latestState : $state');
    print(dummyCartProductDtoList);
  }

  double getTotalAmount() {
    double totalAmount = 0;

    if ((state.value != null)) {
      for (var e in state.value!) {
        totalAmount = totalAmount + e.selectedProduct.price;
      }
    }
    return totalAmount;
  }

  double getShippingFee() {
    double totalShippingFee = 0;

    if ((state.value != null)) {
      for (var e in state.value!) {
        if (e.selectedProduct.shippingPrice != null) {
          totalShippingFee =
              totalShippingFee + e.selectedProduct.shippingPrice!;
        }
      }
    }
    return totalShippingFee;
  }

  decreaseItemCounter({required String orderProductId}) {
    if ((state.value != null)) {
      CartProduct orderProduct =
          state.value!.firstWhere((element) => element.id == orderProductId);
    }
  }
}
