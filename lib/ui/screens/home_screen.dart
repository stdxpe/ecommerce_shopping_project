import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
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
                  onPressed();
                },
                child: const BannerSlider()),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Stack',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardStack(
              productsList: dummyProductList,
              cardWidth: 500,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardHorizontal(
              // isCardElevated: false,
              productsList: dummyProductList,
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
              // isCardElevated: false,
              productsList: dummyProductShortList,
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
              productsList: dummyDealsOfTheWeekProductList,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Detailed',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalDetailed(
              useItemCounter: false,
              isCardElevated: false,
              productsList: dummyProductShortList,
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
              // isCardElevated: false,
              productsList: dummyProductList,
              itemCountOnRow: 2,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            const SizedBox(height: 15),
            HorizontalListviewProductCardVerticalAlternate(
              isCardElevated: false,
              productsList: dummyProductList,
              cardWidth: 400,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Gridview Vertical Card',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            GridviewProductCardVertical(
              isCardElevated: false,
              productsList: dummyProductList,
              itemCountOnRow: 3,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
