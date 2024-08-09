import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_collections.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/dialog_popup_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_alternate.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_stack.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/banner_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/product_card_deals_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(
        useShadow: true,
        useTitle: true,
      ),
      body: SafeArea(
        // top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            GestureDetector(
                onTap: () {
                  ref.read(dialogPopupProvider.notifier).newDeals(
                      context: context, collection: dummyCollections[2]);
                },
                child: const BannerSlider()),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardVerticalAlternate(
              // useShimmer: true,
              isCardElevated: false,
              productsList: dummyAllProducts,
              cardWidth: 400,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardHorizontal(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              cardWidth: 700,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Mini',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalMini(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: AppStrings.dealsOfTheWeek,
              buttonText: '',
            ),
            ProductCardDealsSlider(
              /// HERE
              // productsList: dummyDealsOfTheWeekProductList,
              productsList: dummyAllProducts,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Detailed',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalDetailed(
              useShimmer: true,
              useItemCounter: false,
              isCardElevated: false,
              productsList: dummyAllProducts,
              cardHeight: 300,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardVertical(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              itemCountOnRow: 2,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Stack',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardStack(
              useShimmer: true,
              productsList: dummyAllProducts,
              cardWidth: 500,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Gridview Vertical Card',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            GridviewProductCardVertical(
              useShimmer: true,
              isCardElevated: false,
              productsList: dummyAllProducts,
              itemCountOnRow: 3,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
