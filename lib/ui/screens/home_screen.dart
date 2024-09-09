import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_collections.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/banner_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/product_card_deals_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(useShadow: true, useTitle: true),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            GestureDetector(
                onTap: () => context.push(Routes.dialogNewDeals,
                    extra: dummyCollections[2]),
                child: const BannerSlider()),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Gridview Vertical Card',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            GridviewProductCardVertical(
              itemCountOnRow: 3,
              provider: collectionsProvider,
              collection: Collections.summer,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Product Card Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            ListviewProductCardVertical(
              itemCountOnRow: 2,
              provider: collectionsProvider,
              collection: Collections.winter,
            ),
            // TitleWithTextButton(
            //   onPressed: () {},
            //   title: 'Card Horizontal Mini',
            //   buttonText: AppStrings.collectionTitleRightButton,
            // ),
            // ProductCardHorizontalMini(
            //     product: ref.watch(collectionsProvider).value![0].products[0],
            //     card: ref.watch(horizontalCard(
            //         (cardHeight: 200, cardWidth: null, ctx: context)))),
            // TitleWithTextButton(
            //   onPressed: () {},
            //   title: AppStrings.dealsOfTheWeek,
            //   buttonText: '',
            // ),
            SizedBox(height: 70.h),
            ProductCardDealsSlider(
              /// HERE
              // productsList: dummyDealsOfTheWeekProductList,
              productsList: dummyAllProducts,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Card Horizontal Detailed',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            ListviewProductCardHorizontalDetailed(
              provider: shoppingCartProvider,
              cardHeight: 250,
              dismissibleEnabled: true,
            ),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
