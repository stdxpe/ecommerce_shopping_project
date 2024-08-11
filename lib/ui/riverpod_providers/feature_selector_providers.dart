import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';

final featureSelectorOnPressedProvider =
    FutureProvider.family<void, Product>((ref, product) async {
  String selectedColor = product.colors[ref.watch(colorSelectorProvider)];
  String selectedSize = product.sizes[ref.watch(sizeSelectorProvider)];

  var result =
      await ref.read(shoppingCartProvider.notifier).addProductToShoppingCart(
            cartProduct: CartProduct(
              id: product.id,
              selectedProduct: product,
              selectedColor: selectedColor,
              selectedSize: selectedSize,
              itemCount: 1,
            ),
          );

  ref.watch(goRouterProvider).pop();

  if (result) {
    ref.watch(goRouterProvider).push(Routes.dialogAddedToCart, extra: product);
  }

  /// TODO: Else error message
});

final sizeSelectorProvider = StateProvider<int>((ref) {
  int currentIndex = 0;
  return currentIndex;
});

final sizeSelectorIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(sizeSelectorProvider) == index ? true : false;
});

final colorSelectorProvider = StateProvider<int>((ref) {
  int currentIndex = 0;
  return currentIndex;
});

final colorSelectorIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(colorSelectorProvider) == index ? true : false;
});
