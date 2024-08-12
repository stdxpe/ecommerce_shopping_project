import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/no_items_found_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_listview.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

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
            itemCount: ref.watch(wishlistProvider.notifier).getWishlistCount(),
          ),
          ref.watch(wishlistProvider).when(
              loading: () => const CardPlaceholderListView(cardHeight: 200),
              error: (error, stackTrace) => const ErrorOccuredWidget(),
              data: (data) => (data.isNotEmpty)
                  ? VerticalListviewProductCardHorizontalMini(
                      productsList: data,
                      dismissibleEnabled: true,
                      onDismissed: (index) => ref
                          .read(wishlistProvider.notifier)
                          .deleteProductFromWishlist(productId: data[index].id),
                      useSoftShadow: true,
                      cardHeight: 200,
                      paddingMain: Constants.kMainPaddingHorizontal,
                      paddingBetweenElements:
                          Constants.kMainSpacingBTWCardsHorizontal,
                    )
                  : const NoItemsFoundWidget()),
          SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
        ],
      ),
    );
  }
}
