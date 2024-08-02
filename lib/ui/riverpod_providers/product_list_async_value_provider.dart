import 'dart:async';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/tab_controller_provider.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/screens/test_screen.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final myAsyncNotifierProvider1 =
    AsyncNotifierProvider<MyAsyncNotifier, List<Product>>(() {
  return MyAsyncNotifier();
});

class MyAsyncNotifier extends AsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() async {
    // return await _dbManager.getAllProducts();
    var tempList = getAllProducts();
    var temp2 = await future;
    return temp2;
  }

  final _dbManager = locator<IDBRepository>();

  void getAllProducts() async {
    print('MyAsyncNotifier : AsyncNotifier getAllProducts() Executed');

    state = const AsyncLoading();
    var allProducts = await AsyncValue.guard(_dbManager.getAllProducts);
    state = allProducts;
    // ref.read(provider)
  }

  // ref.read(provider)

  Future<void> createProduct() async {
    print('MyAsyncNotifier : AsyncNotifier createProduct() Executed');

    // state = const AsyncLoading();
    // var createdProduct = await AsyncValue.guard(_dbManager.createProduct);
    var createdProduct = dummyProducts[1];

    final previousState = await future;
    state = AsyncData([...previousState, createdProduct]);
  }

  Future<void> getProductByFilter() async {
    print('MyAsyncNotifier : AsyncNotifier getProductByFilter() Executed');

    state = const AsyncLoading();
    // var createdProduct = await AsyncValue.guard(_dbManager.createProduct);
    var filteredProducts = dummyProducts.where(
      (element) {
        var tempItem = element.title.toLowerCase();
        var tempFilter = 'NECK'.toLowerCase();
        return tempItem.contains(tempFilter);
      },
    ).toList();

    // final previousState = await future;
    state = AsyncData([...filteredProducts]);
  }

  Future<void> deleteProduct(int index) async {
    print('MyAsyncNotifier : AsyncNotifier deleteProduct() Executed');

    // state = const AsyncLoading();
    // var createdProduct = await AsyncValue.guard(_dbManager.createProduct);

    List<Product> previousState = await future;
    previousState.removeAt(index);

    state = AsyncData([...previousState]);
  }

  Future<void> updateProduct({required BuildContext menuScreenContext}) async {
    print('MyAsyncNotifier : AsyncNotifier updateProduct() Executed');

    // state = const AsyncLoading();
    // var createdProduct = await AsyncValue.guard(_dbManager.createProduct);

    List<Product> previousState = await future;

    // var foundProduct = previousState.where(
    //   (element) {
    //     return element.title.contains('Gucci');
    //   },
    // );
    var foundProductIndex = previousState.indexWhere(
      (element) {
        return element.title.contains('Neck');
      },
    );
    if (foundProductIndex.isNegative) return;
    previousState.removeAt(foundProductIndex);

    var updatedProduct = Product(
      title: 'Valencia',
      price: 21.21,
      mainPhoto: AppImages.blackBg,
      brand: 'Ver',
      categories: [
        // dummyCategories[0],
      ],
      collections: [
        // dummyCollections[0],
      ],
      colors: [],
      createdAt: '123',
      description: 'sdfgsdf',
      estimatedShippingDurationInDays: 2,
      id: '234',
      isFreeShipping: true,
      photos: [],
      reviews: [],
      shippingPrice: 0,
      sizes: [],
      stockCount: 12,
      storeId: '01',
      storeName: 'sdfg',
      summary: 'asasdfasd',
      totalLikesCount: 12,
      totalOrdersCount: 32,
      totalRating: 2.2,
    );
    var newList = [previousState.insert(foundProductIndex, updatedProduct)];
    showDialog(
      useRootNavigator: false,
      barrierColor: Colors.black.withOpacity(0.75),
      context: menuScreenContext,
      builder: (context) {
        return TestScreen(
          onPressed: () {
            Navigator.of(context, rootNavigator: false).pop();

            /// TODO: Create riverpod ref for tab controller
            // ref.watch(tabControllerProvider).jumpToTab(2);
            PersistentNavBarNavigator.pushNewScreen(
              pageTransitionAnimation: PageTransitionAnimation.fade,
              menuScreenContext,
              screen: const ProfileScreen(),
              withNavBar: true,
            );
          },
        );
      },
    );
    state = AsyncData([...previousState]);
  }
}
