import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';

final featureSelectorOnPressedProvider =
    FutureProvider.family<bool, Product>((ref, product) async {
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
  return result;
});

// final featureSelectorProvider =
//     StateNotifierProvider<FeatureSelectorNotifier, void>((ref) {
//   return FeatureSelectorNotifier(ref: ref);
// });

// class FeatureSelectorNotifier extends StateNotifier<void> {
//   FeatureSelectorNotifier({required this.ref}) : super(null);
//   final StateNotifierProviderRef ref;

//   addToCart(BuildContext context, Product product) async {
//     String selectedColor = product.colors[ref.watch(colorSelectorProvider)];
//     String selectedSize = product.sizes[ref.watch(sizeSelectorProvider)];
//     context.findRootAncestorStateOfType<NavigatorState>()?.pop();

//     var result =
//         await ref.read(shoppingCartProvider.notifier).addProductToShoppingCart(
//               cartProduct: CartProduct(
//                 id: product.id,
//                 selectedProduct: product,
//                 selectedColor: selectedColor,
//                 selectedSize: selectedSize,
//                 itemCount: 1,
//               ),
//             );

// //  final NavigatorState navigator = rootNavigator
// //         ? context.findRootAncestorStateOfType<NavigatorState>()
// //         : context.findAncestorStateOfType<NavigatorState>();
//     // final NavigatorState navigator =
//     //     context.findRootAncestorStateOfType<NavigatorState>()!;

//     // navigator.context.pop();

//     // context.findRootAncestorStateOfType<NavigatorState>()?.pop();

//     if (result) {
//       // ref.read(goRouterProvider).pop();

//       ref
//           .read(dialogPopupProvider.notifier)
//           .addedToCart(context: context, product: product);
//     }
//   }
// }

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
