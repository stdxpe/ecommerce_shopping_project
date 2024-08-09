import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/dialog_popup_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';

final featureSelectorProvider =
    StateNotifierProvider<FeatureSelectorNotifier, void>((ref) {
  return FeatureSelectorNotifier();
});

class FeatureSelectorNotifier extends StateNotifier<void> {
  FeatureSelectorNotifier() : super(null);

  addToCart(BuildContext context, WidgetRef ref, Product product) async {
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

    context.pop();
    if (result) {
      ref
          .read(dialogPopupProvider.notifier)
          .addedToCart(context: context, product: product);
    }
  }
}

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
