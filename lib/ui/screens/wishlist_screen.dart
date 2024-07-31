import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
              title: AppStrings.wishlistScreenTitle,
              itemCount: 13,
            ),
            VerticalListviewProductCardHorizontalMini(
              dismissibleEnabled: true,
              // isCardElevated: false,
              useSoftShadow: true,
              productsList: dummyProducts,
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
