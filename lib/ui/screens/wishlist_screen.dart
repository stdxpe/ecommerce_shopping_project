import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_screen_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/product_list_async_value_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({
    super.key,
    this.menuScreenContext,
  });

  final BuildContext? menuScreenContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(wishlistScreenProvider.notifier)
              .addProductToWishlist(productId: '000003');
        },
      ),
      appBar: const AppBarMain(),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          const TitleMain(
            title: AppStrings.wishlistScreenTitle,
            itemCount: 13,
          ),

          // ref.watch(myFutureProvider1).when(
          ref.watch(wishlistScreenProvider).when(
                loading: () => VerticalListviewProductCardHorizontalMini(
                  useShimmer: true,
                  dismissibleEnabled: true,
                  useSoftShadow: true,
                  // productsList:    ref.watch(myStateNotifierProvider1.notifier).getAllProducts(),
                  productsList: dummyAllProducts,
                  cardHeight: 200,
                  // cardHeight: ref.watch(testProvider),
                  paddingMain: Constants.kMainPaddingHorizontal,
                  paddingBetweenElements:
                      Constants.kMainSpacingBTWCardsHorizontal,
                ),
                error: (error, stackTrace) => const Text(
                  'Error',
                  style: TextStyle(color: Colors.black),
                ),

                ///////////////////////////////////
                //////////////////////////////////// HERE
                data: (data) => VerticalListviewProductCardHorizontalMini(
                  onDismissed: (index) {
                    ref
                        .read(wishlistScreenProvider.notifier)
                        .deleteProductFromWishlist(productId: data[index].id);
                  },
                  useShimmer: false,
                  dismissibleEnabled: true,
                  useSoftShadow: true,
                  // productsList:    ref.watch(myStateNotifierProvider1.notifier).getAllProducts(),
                  productsList: data,
                  cardHeight: 200,
                  // cardHeight: ref.watch(testProvider),
                  paddingMain: Constants.kMainPaddingHorizontal,
                  paddingBetweenElements:
                      Constants.kMainSpacingBTWCardsHorizontal,
                ),
              ),
          // VerticalListviewProductCardHorizontalMini(
          //   // dismissibleEnabled: true,
          //   useSoftShadow: true,
          //   productsList: dummyProducts,
          //   cardHeight: 200,
          //   // cardHeight: ref.watch(testProvider),
          //   paddingMain: Constants.kMainPaddingHorizontal,
          //   paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
          // ),
        ],
      ),
    );
  }
}
