import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const TitleMain(
              title: AppStrings.searchScreenTitle,
              itemCount: 13,
              icon: Icons.tune,
            ),
            VerticalListviewProductCardHorizontalMini(
              isCardElevated: true,
              productsList: dummyProductShortList,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
          ],
        ),
      ),
    );
  }
}
