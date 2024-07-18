import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_alternate.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_stack.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/banner_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   surfaceTintColor: Colors.white,
      // ),
      body: SafeArea(
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
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardHorizontal(
              isCardElevated: true,
              productsList: dummyProductList,
              cardWidth: 700,
              cardHeight: 190,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            const SizedBox(height: 15),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Mini',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalMini(
              isCardElevated: true,
              productsList: dummyProductShortList,
              cardHeight: 250,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            const SizedBox(height: 15),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Detailed',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalDetailed(
              isCardElevated: true,
              productsList: dummyProductShortList,
              cardHeight: 300,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardVertical(
              isCardElevated: true,
              productsList: dummyProductList,
              itemCountOnRow: 2,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            const SizedBox(height: 15),
            HorizontalListviewProductCardVerticalAlternate(
              isCardElevated: true,
              productsList: dummyProductList,
              cardWidth: 400,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Gridview Vertical Card',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            GridviewProductCardVertical(
              isCardElevated: true,
              productsList: dummyProductList,
              itemCountOnRow: 3,
              paddingMain: Constants.kPaddingMainHorizontal,
              paddingBetweenElements:
                  Constants.kPaddingMainBetweenCardsHorizontal,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
