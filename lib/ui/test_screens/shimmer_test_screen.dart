import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShimmerTestScreen extends StatelessWidget {
  const ShimmerTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          VerticalListviewProductCardHorizontalMini(
            useShimmer: true,
            dismissibleEnabled: true,
            useSoftShadow: true,
            productsList: dummyAllProducts,
            cardHeight: 200,
            paddingMain: Constants.kMainPaddingHorizontal,
            paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
          ),
        ],
      ),
    );
  }
}
