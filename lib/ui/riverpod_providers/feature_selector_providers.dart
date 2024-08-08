import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartButtonProvider =
    StateProvider.family<void, Product>((ref, product) {
  String selectedColor = product.colors[ref.watch(colorSelectorProvider)];
  String selectedSize = product.sizes[ref.watch(sizeSelectorProvider)];

  ref.read(shoppingCartProvider.notifier).addProductToShoppingCart(
        cartProduct: CartProduct(
          // id: '000007',
          id: product.id,
          selectedProduct: product,
          selectedColor: selectedColor,
          selectedSize: selectedSize,
          itemCount: 1,
        ),
      );
});

final sizeSelectorProvider = StateProvider<int>((ref) {
  return 0;
});

final sizeSelectorIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(sizeSelectorProvider) == index ? true : false;
});

final colorSelectorProvider = StateProvider<int>((ref) {
  return 0;
});

final colorSelectorIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(colorSelectorProvider) == index ? true : false;
});
