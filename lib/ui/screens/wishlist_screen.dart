import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          TitleMain(
            title: AppStrings.wishlistScreenTitle,
            itemCount: ref.watch(wishlistProvider).value?.length,
          ),
          ref.watch(wishlistProvider).when(
                loading: () => const CardPlaceholderListView(cardHeight: 200),
                error: (error, stackTrace) => const Text(
                  AppStrings.globalStateErrorMessage,
                  style: TextStyle(color: Colors.black),
                ),

                ///////////////////////////////////
                //////////////////////////////////// HERE
                data: (data) {
                  if (data.isNotEmpty) {
                    return VerticalListviewProductCardHorizontalMini(
                      onDismissed: (index) => ref
                          .read(wishlistProvider.notifier)
                          .deleteProductFromWishlist(productId: data[index].id),
                      useShimmer: false,
                      dismissibleEnabled: true,
                      useSoftShadow: true,
                      productsList: data,
                      cardHeight: 200,
                      paddingMain: Constants.kMainPaddingHorizontal,
                      paddingBetweenElements:
                          Constants.kMainSpacingBTWCardsHorizontal,
                    );
                  }
                  return Icon(Icons.face);
                },
              ),
        ],
      ),
    );
  }
}
