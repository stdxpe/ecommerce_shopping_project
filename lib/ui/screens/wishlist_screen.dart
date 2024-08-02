import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
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
          ref.read(myAsyncNotifierProvider1.notifier).updateProduct(
                menuScreenContext: menuScreenContext!,
              );
          // .getWishlistProducts();
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
          ref.watch(myAsyncNotifierProvider1).when(
                loading: () => VerticalListviewProductCardHorizontalMini(
                  useShimmer: true,
                  dismissibleEnabled: true,
                  useSoftShadow: true,
                  // productsList:    ref.watch(myStateNotifierProvider1.notifier).getAllProducts(),
                  productsList: dummyProducts,
                  cardHeight: 200,
                  // cardHeight: ref.watch(testProvider),
                  paddingMain: Constants.kMainPaddingHorizontal,
                  paddingBetweenElements:
                      Constants.kMainSpacingBTWCardsHorizontal,
                ),
                error: (error, stackTrace) => Text(
                  'Error',
                  style: TextStyle(color: Colors.black),
                ),
                data: (data) => VerticalListviewProductCardHorizontalMini(
                  onDismissed: (index) {
                    ref
                        .read(myAsyncNotifierProvider1.notifier)
                        .deleteProduct(index);
                    print(index);
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
