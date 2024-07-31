import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_search_field.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearchField(
        searchOnPressed: () {
          FocusScope.of(context).unfocus();

          /// TODO: Riverpod Search Functionality methods here.
          setState(() {
            opacity = 1;
          });
        },
      ),
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 200),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.searchScreenTitle,
              itemCount: 13,
              icon: Icons.tune,
              onPressed: () {},
            ),
            VerticalListviewProductCardHorizontalMini(
              // isCardElevated: false,
              useSoftShadow: true,

              /// TODO: This list gotta come from Riverpod Search Functionality methods
              // productsList: dummyProductShortList,
              productsList: dummyProducts,

              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements:
                  Constants.kMainSpacingBTWCardsHorizontal * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
